require 'rails_helper'

describe "when a user visits a specific snack page" do
  it "sees name and price of snack, list of locations of vending machines that carry it, average price for snacks in those vending machines, and count of different kinds of items in those vending machines" do
    owner = Owner.create(name: "Sam's Snacks")
    machine_1 = owner.machines.create(location: "Don's Mixed Drinks")
    machine_2 = owner.machines.create(location: "Turing Basement")
    snack_1 = machine_1.snacks.create(name: "Cheetos", price: 1)
    snack_2 = machine_1.snacks.create(name: "Donuts", price: 2)
    snack_3 = machine_1.snacks.create(name: "Peanuts", price: 3)
    snack_4 = machine_2.snacks.create(name: "Apple Slices", price: 2)
    machine_2.snacks.new(name: "Cheetos", price: 1)

    visit snack_path(snack_1)

    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_1.price)
    expect(page).to have_content("Locations: *#{machine_1.location}")
    expect(page).to have_content("3 kinds of snacks")
    expect(page).to have_content("average price of $2.0")
    expect(page).to have_content("Locations: *#{machine_2.location}")
    expect(page).to have_content("2 kinds of snacks")
    expect(page).to have_content("average price of $1.5")
  end
end
