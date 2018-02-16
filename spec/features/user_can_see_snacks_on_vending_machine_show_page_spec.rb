require 'rails_helper'

describe "As a user" do
  describe "When I visit a specific vending machine page" do
    it "I see the name of all of the snacks associated with that vending machine along with their price" do
      owner = Owner.create(name: "Sam's Snacks")
      machine = owner.machines.create(location: "38th and Mariposa")
      snack_1 = machine.snacks.create(name: "Cheetos", price: 1)
      snack_2 = machine.snacks.create(name: "Donuts", price: 2)

      visit machine_path(machine)

      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_2.name)
      expect(page).to have_content("$1.5")
    end
  end
end
