require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def new_product(image_url) Product.new(title: "My Book Title",
    description: "yyy",
    price: 1)
    product.image.attach(io: File.open("test/fixtures/files/lorem.jpg"),
    filename: "lorem.jpg", content_type: "image/jpeg")
  end

  test "image url" do product = Product.new(
    title: "My Book Title", description: "yyy",
    price: 1)

    product.image.attach(io: File.open("test/fixtures/files/lorem.jpg"), filename: "lorem.jpg", content_type: "image/jpeg")
    assert product.valid?, "image/jpeg must be valid"

    product = Product.new(
    title: "My Book Title",
    description: "yyy",
    price: 1)

    product.image.attach(io: File.open("test/fixtures/files/logo.svg"),
    filename: "lorem.jpg", content_type: "image/svg+xml")
    assert_not product.valid?, "image/svg+xml must be invalid"
  end

  test "product is not valid without a unique title" do
    product = Product.new(title: products(:pragprog).title, description: "yyy", price: 1)
    product.image.attach(io: File.open("test/fixtures/files/lorem.jpg"), filename: "lorem.jpg", content_type: "image/jpeg")
    assert product.invalid?
    assert_equal [ "has already been taken" ], product.errors[:title]
  end
end
