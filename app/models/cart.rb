class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items


  def total
    items.inject(0) { |sum, item| sum += item.price }
  end

  def checkout
    user.update_total_spent(total)
    items.each { |item| item.inventory -= 1 }
    self.status = 'Submitted'
  end
end
