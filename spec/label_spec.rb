require_relative('../classes/label')

describe Label do
  before :all do
    @label = Label.new('Action', 'red')
    @item = Item.new('16-09-2008')
    @label.add_item(@item)
  end

  it 'Check if the created label is an instance of Label class' do
    expect(@label).to be_instance_of Label
  end

  it 'Check if item can be stored in items' do
    collected_items = @label.items
    expect(collected_items).to include @item
  end

  it 'Check if self label is set label for added item' do
    label = @item.label
    expect(label).to eq @label
  end
end
