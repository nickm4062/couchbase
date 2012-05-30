describe_recipe "couchbase::test_buckets" do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  MiniTest::Chef::Resources.register_resource :couchbase_bucket, :username, :password

  describe "default bucket" do
    let(:bucket) { couchbase_bucket "default" }

    it "exists" do
      assert bucket.exists
    end

    it "has a 100MB quota" do
      bucket.must_have :memory_quota_mb, 100
    end

    it "has 1 replica" do
      buckdet.must_have :replicas, 1
    end
  end
end