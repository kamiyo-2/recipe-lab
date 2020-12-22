require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    @post.post_image = fixture_file_upload("#{Rails.root}/public/images/test_image.png")
  end

  describe '新規投稿機能がうまくいくとき' do

    it "text,post_imageが存在すれば登録できる" do
      expect(@post).to be_valid
    end
  end

  context '新規投稿機能がうまくいかないとき' do 
    it "imageが空だと登録できない" do
      @post.post_image = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("画像を入力してください")
    end
    it "textが空だと登録できない" do
      @post.title = ""
      @post.valid?
      expect(@post.errors.full_messages).to include("テキストを入力してください")
    end
  end
end
