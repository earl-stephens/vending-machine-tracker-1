require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "they see name of all snacks" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "White Castle Burger", price: 3.50)
    snack_2 = dons.snacks.create(name: "Pop Rocks", price: 1.50)
    snack_3 = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content("White Castle Burger: $3.5")
    expect(page).to have_content("Pop Rocks: $1.5")
    expect(page).to have_content("Flaming Hot Cheetos: $2.5")

  end

  it 'shows average price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "White Castle Burger", price: 3.50)
    snack_2 = dons.snacks.create(name: "Pop Rocks", price: 1.50)
    snack_3 = dons.snacks.create(name: "Flaming Hot Cheetos", price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: $2.5")
  end
end
