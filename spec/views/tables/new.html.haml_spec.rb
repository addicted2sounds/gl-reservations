require 'rails_helper'

RSpec.describe "tables/new", type: :view do
  before(:each) do
    assign(:table, Table.new(
      :number => 1,
      :notes => "MyText"
    ))
  end

  it "renders new table form" do
    render

    assert_select "form[action=?][method=?]", tables_path, "post" do

      assert_select "input#table_number[name=?]", "table[number]"

      assert_select "textarea#table_notes[name=?]", "table[notes]"
    end
  end
end
