require 'rails_helper'
describe Product do
  describe '#create' do
    it "nameが空だと登録できない" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
    
    it "descriptionが空だと登録できない" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "category_idが空だと登録できない" do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "likes_countが空だと登録できない" do
      product = build(:product, likes_count: "")
      product.valid?
      expect(product.errors[:likes_count]).to include("を入力してください")
    end

    it "imageが空だと登録できない" do
      product = build(:product, image: "")
      product.valid?
      expect(product.errors[:image]).to include("を入力してください")
    end

    it "nameが21文字以上だと登録できない" do
      product = build(:product, name: "a" * 21)
      product.valid?
      expect(product.errors[:name]).to include("は20文字以内で入力してください")
    end

    it "descriptionが151文字以上だと登録できない" do
      product = build(:product, description: "a" * 151)
      product.valid?
      expect(product.errors[:description]).to include("は150文字以内で入力してください")
    end

    it "全のバリデーションクリアできると登録できる。name, description, image, category_id, likes_count" do
      product = build(:product)
      expect(product).to be_valid
    end
  end
end