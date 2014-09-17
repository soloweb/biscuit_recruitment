require 'spec_helper'

describe MenuItem do
  it "creates a menu item with an external link" do
    @menu_item = MenuItem.create(name: 'Soloweb', menu: 'top', link: 'http://soloweb.com')
    expect(MenuItem.all.count).to eq(1)
  end

  it "creates a menu item with a page_id" do
    @page = Page.create(title: 'Homepage', content: 'This is the homepage')
    @menu_item = MenuItem.create(name: 'Soloweb', menu: 'top', page_id: @page.id)
    expect(MenuItem.all.count).to eq(1)
  end

  it "should raise an error if a link and page_id are not provided" do
    @menu_item = MenuItem.create(name: 'Soloweb', menu: 'top')
    expect(@menu_item.valid?).to eq(false)
  end

  it "should raise an error if a link and page_id are provided" do
    @page = Page.create(title: 'Homepage', content: 'This is the homepage')
    expect { Fabricate(:menu_item, page_id: @page.id) }.to raise_error
  end
  
  it "should raise an error if a menu is given that is not in the list" do
    expect { Fabricate(:menu_item, menu: 'notavalidmenu') }.to raise_error
  end
end
