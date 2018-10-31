require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "adi") }
  subject (:dessert) {Dessert.new("cake", 100, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(100)
    end


    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty

    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("brownie", "string", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to_not include "eggs"
      dessert.add_ingredient("eggs")
      expect(dessert.ingredients).to include("eggs")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("eggs")
      dessert.add_ingredient("flour")
      dessert.add_ingredient("butter")
      dessert.add_ingredient("sugar")
      expect(dessert.mix!).not_to eq(["eggs", "flour","butter", "sugar"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(dessert.eat(2)).to eq(98)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(1000)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize).and_return("Adi")
      expect(dessert.serve).to eq("Adi has made 100 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
