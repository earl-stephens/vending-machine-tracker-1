require "rails_helper"

# User Story 3 of 3
#
# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
# Flaming Hot Cheetos
# Price: $2.50
# Locations
# * Don's Mixed Drinks (3 kinds of snacks, average price of $2.50)
# * Turing Basement (2 kinds of snacks, average price of $3.00)
describe 'visiting snack show page' do
  it 'shows snack info' do
    sam = Owner.create(name: "Sam's Snacks")
    drew = Owner.create(name: "Drew's Drinks")
    machine_1 = sam.machines.create(location: "here")
    machine_2 = drew.machines.create(location: "there")
    candy = machine_1.snacks.create(name: "Snickers", price: 3.0)
    gum = machine_2.snacks.create(name: "Wrigleys", price: 5.0)
    cheetos = machine_1.snacks.create(name: "Flaming Hot Cheetos", price: 4.0)
    machine_2.snacks << candy
    machine_2.snacks << cheetos
    # cheetos2 = machine_2.create(name: "Flaming Hot Cheetos", price: 3.5)

    visit snack_path(cheetos)

    expect(page).to have_content("Price: 2.5")
    expect(page).to have_content("Locations")
    expect(page).to have_content("#{machine_1.location}, 2 kinds of snacks, avg price 3.5")
    expect(page).to have_content("#{machine_2.location}, 3 kinds of snacks, avg price 4.0")

  end
end
