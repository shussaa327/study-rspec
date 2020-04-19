require 'rails_helper'

RSpec.describe Post, type: :model do
  context "データが正しく保存される" do
    before do
      @post = Post.new
      @post.title = "Hello"
      @post.content = "Hi"
      @post.save
    end
    it "全て入力されているため保存される" do
      expect(@post).to be_valid
    end
  end
  context "データが正しく保存されない" do
    before do
      @post = Post.new
      @post.title = ""
      @post.content = "hi"
      @post.save
    end
    it "titleが空で保存されない" do
      expect(@post).to be_invalid
      expect(@post.errors[:title]).to include("can't be blank")
    end
  end
end
