# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
RepairService.delete_all
Repair.delete_all
Service.delete_all
Bike.delete_all
Staff.delete_all
Customer.delete_all

service_data = [
  [ "Tire change", 15000 ],
  [ "Flat tire repair", 10000 ],
  [ "Brake adjustment", 20000 ],
  [ "Brake pad replacement", 25000 ],
  [ "Chain lubrication", 15000 ],
  [ "Chain replacement", 20000 ],
  [ "Central axle lubrication", 25000 ],
  [ "Steering lubrication", 22000 ],
  [ "Fork maintenance", 20000 ],
  [ "Bicycle assembly", 40000 ],
  [ "Basic maintenance", 30000 ],
  [ "Complete maintenance", 50000 ],
  [ "Gear adjustment", 18000 ],
  [ "Wheel alignment", 20000 ],
  [ "Tire pressure check", 5000 ],
  [ "Safety inspection", 12000 ],
  [ "Pedal replacement", 15000 ],
  [ "Seat adjustment", 8000 ],
  [ "Cable replacement", 18000 ],
  [ "Wheel replacement", 45000 ]
]

services = service_data.map do |name, price|
  Service.create!(
    name: name,
    current_price: price
  )
end

staff_data = [
  [ "Diego Soto", "mechanic" ],
  [ "Felipe Rojas", "mechanic" ],
  [ "Martín Contreras", "mechanic" ],
  [ "Paula Reyes", "counter" ]
]

staffs = staff_data.map do |name, role|
  Staff.create!(
    name: name,
    role: role
  )
end

# Customers

customer_data = [
  [ "Ana Morales", "961234501" ],
  [ "Benjamín Silva", "962345102" ],
  [ "Carolina Vega", "963456203" ],
  [ "Daniel Fuentes", "964567304" ],
  [ "Elena Muñoz", "965678405" ],
  [ "Felipe Castro", "966789506" ],
  [ "Gabriela Torres", "967891607" ],
  [ "Hugo Navarro", "968912708" ],
  [ "Ignacia Pérez", "969123809" ],
  [ "Javier Ramírez", "970234910" ]
]

customers = customer_data.map do |name, phone|
  Customer.create!(
    name: name,
    phone: phone
  )
end

bike_data = [
  [ 0, "Trek", "Marlin 5", "Blue", "WH-001" ],
  [ 0, "Trek", "Marlin 5", "Blue", "WH-002" ],
  [ 1, "Giant", "Talon 2", "Black", "WH-003" ],
  [ 2, "Oxford", "Orion", "Red", "WH-004" ],
  [ 3, "Specialized", "Rockhopper", "Green", "WH-005" ],
  [ 4, "Scott", "Aspect 950", "Gray", "WH-006" ],
  [ 5, "Cannondale", "Trail 7", "Orange", "WH-007" ],
  [ 6, "Bianchi", "Via Nirone", "White", "WH-008" ],
  [ 7, "Merida", "Big Nine", "Black", "WH-009" ],
  [ 8, "Giant", "Escape 3", "Silver", "WH-010" ],
  [ 8, "Trek", "Domane AL 2", "Red", "WH-011" ],
  [ 9, "Oxford", "Merak", "Blue", "WH-012" ]
]

bikes = bike_data.map do |customer_index, brand, model, color, serial_number|
  Bike.create!(
    customer_id: customers[customer_index].id,
    brand: brand,
    model: model,
    color: color,
    serial_number: serial_number
  )
end

same_day = 20.days.ago.change(hour: 9)
old_received = (Date.current.beginning_of_year - 2.months).in_time_zone
repair_data = [
  [ 0, nil, 1.day.ago, Date.current + 3.days, nil, "received", nil, nil ],
  [ 1, 0, 2.days.ago, Date.current + 2.days, nil, "diagnosing", nil, nil ],
  [ 2, 1, 3.days.ago, Date.current + 1.day, nil, "awaiting approval", nil, nil ],
  [ 3, 2, 4.days.ago, Date.current + 2.days, "approved", "approved", nil, nil ],
  [ 4, 0, 5.days.ago, Date.current - 2.days, "declined", "declined", nil, nil ],
  [ 5, 1, 6.days.ago, Date.current + 1.day, "approved", "in progress", nil, nil ],
  [ 6, 2, 10.days.ago, Date.current - 5.days, "approved", "ready", 2.days.ago, nil ],
  [ 7, 0, 12.days.ago, Date.current - 8.days, "approved", "picked up", 9.days.ago, 8.days.ago ],
  [ 8, 1, same_day, same_day.to_date, "approved", "picked up", same_day.change(hour: 16), same_day.change(hour: 18) ],
  [ 0, 2, old_received, old_received.to_date + 3.days, "approved", "picked up", old_received + 2.days, old_received + 3.days ],
  [ 9, nil, 1.day.ago, Date.current + 4.days, nil, "received", nil, nil ],
  [ 10, 0, 3.days.ago, Date.current + 2.days, nil, "diagnosing", nil, nil ],
  [ 1, 1, 4.days.ago, Date.current + 2.days, nil, "awaiting approval", nil, nil ],
  [ 2, 2, 7.days.ago, Date.current + 1.day, "approved", "in progress", nil, nil ],
  [ 3, 0, 9.days.ago, Date.current, "approved", "ready", 1.day.ago, nil ]
]

repairs = repair_data.map do |bike_index, staff_index, received_at,
                              promised_on, approval_status, status,
                              ready_at, picked_up_at|
  Repair.create!(
    bike_id: bikes[bike_index].id,
    staff_id: staff_index.nil? ? nil : staffs[staff_index].id,
    received_at: received_at,
    promised_on: promised_on,
    approval_status: approval_status,
    status: status,
    ready_at: ready_at,
    picked_up_at: picked_up_at
  )
end

repair_service_data = [
  [ 0, 15000 ],
  [ 2, 20000 ],
  [ 5, 20000 ],
  [ 12, 18000 ],
  [ 8, 20000 ],
  [ 6, 25000 ],
  [ 10, 30000 ],
  [ 1, 10000 ],
  [ 2, 18000 ],
  [ 0, 12000 ],
  [ 15, 12000 ],
  [ 18, 18000 ],
  [ 19, 45000 ],
  [ 5, 20000 ],
  [ 11, 50000 ]
]

repair_service_data.each_with_index do |(service_index, price), repair_index|
  RepairService.create!(
    repair_id: repairs[repair_index].id,
    service_id: services[service_index].id,
    price_charged: price
  )
end
