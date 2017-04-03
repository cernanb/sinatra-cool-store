require_relative '../spec_helper'

describe Cart do

  it 'is created with a default status of pending' do
    cart = Cart.create

    expect(cart.status).to eq('pending')
  end

  describe 'associations' do
    let(:cart) {Cart.create}
    let(:item) {Item.create(name: 'Pencil', inventory: 20, price: 2)}
    let(:item2) {Item.create(name: 'Pen', inventory: 30, price: 3)}
    let(:user) {User.new(first_name: 'Cernan', last_name: 'Bernardo', email: 'cernan@flatironschool.com')}

    it 'belongs to a user' do
      cart.user = user

      expect(cart.user).to eq(user)
    end

    it 'has many items' do
      cart.items << item
      cart.items << item2

      expect(cart.items.size).to eq(2)
    end
  end

  describe 'total' do
    let(:cart) {Cart.create}
    let(:item) {Item.create(name: 'iPhone', inventory: 20, price: 200)}
    let(:item2) {Item.create(name: 'xbox', inventory: 10, price: 250)}

    it 'calculates the total of the items in the cart' do
      cart.items << item
      cart.items << item2

      expect(cart.total).to eq(450)
    end
  end

  describe 'checkout' do
    let(:user) {User.new(first_name: 'Cernan', last_name: 'Bernardo', email: 'cernan@flatironschool.com')}
    let(:cart) {Cart.create}
    let(:item) {Item.create(name: 'iPhone', inventory: 20, price: 200)}
    let(:item2) {Item.create(name: 'xbox', inventory: 10, price: 250)}

    before do
      cart.user = user
      cart.items << item
      cart.items << item2
    end

    it 'assigns the total of the cart to an attribute for the user called :total_spent' do
      cart.checkout

      expect(user.total_spent).to eq(450)
    end

    it 'reduces the inventory of each item by 1' do
      cart.checkout

      expect(item.inventory).to eq(19)
      expect(item2.inventory).to eq(9)
    end

    it 'changes the status of the cart from pending to submitted' do
      cart.checkout

      expect(cart.status).to eq('Submitted')
    end
  end

end
