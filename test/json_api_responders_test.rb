require 'test_helper'

class JsonApiRespondersTest < ActionDispatch::IntegrationTest
  setup do
    # Need to set these up every time so that all the tests pass in whatever
    # order they're called - authenticate_user_from_token! will be defined
    # after the failed authentication test for a random set of other tests
    #
    # I think returns(true) is success (doesn't throw, anyway)
    PostsController.any_instance.stubs(:authenticate_user_from_token!).
      returns(true)
    PostsController.send :before_action,  :authenticate_user_from_token!
    @params = { params: { format: :json } }
  end

  test 'it has a gem version' do
    assert_not_nil JsonApiResponders::VERSION
  end

  test 'normal success response' do
    get posts_url, @params
    assert_response :success
  end

  test 'failed authentication' do
    PostsController.any_instance.unstub(:authenticate_user_from_token!)
    PostsController.any_instance.stubs(:authenticate_user_from_token!).
      throws(:warden, :action => :unauthenticated)
    JsonApiResponders.redefine_authorization(PostsController)
    PostsController.any_instance.unstub(:instance_methods)

    @post = attributes_for(:post, title: nil)
    assert_nothing_raised do
      post posts_path, params: { post: @post, format: :json }
    end
    PostsController.any_instance.unstub(:authenticate_user_from_token!)

    r = JSON.parse(response.body)

    assert_response :forbidden
    assert_equal 403, r['status']
    assert_equal 'Unauthorized', r['message']
  end

  test 'rescue RecordNotFound' do
    assert_nothing_raised do
      get post_path(1), @params
    end

    r = JSON.parse(response.body)
    assert_response :not_found
    assert_equal 404, r['status']
    assert_equal 'Not found', r['message']
    assert_equal 'Post', r['resource']
  end

  test 'rescue ParameterMissing' do
    assert_nothing_raised do
      post posts_path, @params
    end

    r = JSON.parse(response.body)
    assert_equal 422, r['status']
    assert_equal 'Missing Parameter', r['message']
    assert_equal 'post', r['resource']
    assert_equal 'Please supply the post param', r['detail']
  end

  test 'post create with blank attribute' do
    @post = attributes_for(:post, title: nil)
    post posts_path, params: { post: @post, format: :json }
    assert_response :unprocessable_entity

    r = JSON.parse(response.body)
    assert_equal 422, r['status']
    assert_equal 'Invalid Attribute', r['message']
    assert_equal 1, r['errors'].size
    assert_equal 'Post', r['errors'][0]['resource']
    assert_equal 'title', r['errors'][0]['field']
    assert_equal 'can\'t be blank', r['errors'][0]['reason']
    assert_equal 'Title can\'t be blank', r['errors'][0]['detail']
  end
end
