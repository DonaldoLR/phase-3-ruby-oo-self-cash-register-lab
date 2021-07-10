class CashRegister 
  attr_accessor :total, :discount, :items, :last_item_cost
  def initialize(employee_discount = 0)
    @total = 0
    @discount = employee_discount
    @items = []
    @last_item = 0
  end
  
  def add_item(title, price, quantity = 1)
   self.total += price * quantity
   quantity.times do 
    self.items << title
   end 
   self.last_item_cost = price * quantity
  end

  def apply_discount 
    self.total = (self.total * (1 - self.discount.to_f / 100.0)).to_i
    if self.discount == 0 
      "There is no discount to apply."
    else 
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction 
    self.items.pop
    if self.items.size == 0 
      self.total = 0
    else 
      self.total -= self.last_item_cost
    end
  end
end
