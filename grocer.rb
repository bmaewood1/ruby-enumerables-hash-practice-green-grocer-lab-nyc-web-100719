

def consolidate_cart(cart)
  final_hash = {}
  cart.each do |element_hash| #cart is an array of hashes, this gets us to first hash TEMPEH
    element_name = element_hash.keys[0]    # .keys hash method returns an array with all the keys -> in this case "TEMPEH"
    element_stats = element_hash.values[0] # .values hash method returns an array with all the values -> in this case price/clearance hash of "TEMPEH"
    if final_hash.has_key?(element_name)
      final_hash[element_name][:count] += 1 
    else
      final_hash[element_name] = {
        count: 1,
        price: element_stats[:price],
        clearance: element_stats[:clearance]
      }
    end
  end
  final_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    item = coupon[:item]
      if cart[item]
        if !cart.has_key?("#{item} W/COUPON") && cart[item][:count] >= coupon[:num]
          cart["#{item} W/COUPON"] = {
            price: coupon[:cost] / coupon[:num],
            clearance: cart[item][:clearance],
            count: coupon[:num]
          }
        elsif cart.has_key?("#{item} W/COUPON") && cart[item][:count] >= coupon[:num]
          cart["#{item} W/COUPON"][:count] += coupon[:num]
        end
        cart[item][:count] -= coupon[:num]
      end
    end
  cart
end


def apply_clearance(cart)
  cart.each do |product_name, stats|
    if stats[:clearance] == true
      
  end
  cart
end

def checkout(cart, coupons)
  # code here
end

