require 'spec_helper'

describe HomepageBlock do
  it "creates a homepage block with a title" do
    @homepage_block = HomepageBlock.create(title: 'Homepage Block Title', alignment: 'left', image: File.open(File.join(Rails.root, 'spec', 'fabricators', 'assets', 'homepage_block_image.png')))
    expect(HomepageBlock.all.count).to eq(1)
  end

  it "creates a homepage block with text" do
    @homepage_block = HomepageBlock.create(text: 'Homepage Block Text', alignment: 'left', image: File.open(File.join(Rails.root, 'spec', 'fabricators', 'assets', 'homepage_block_image.png')))
    expect(HomepageBlock.all.count).to eq(1)
  end

  it "does not create a homepage block with no title or text" do
    @homepage_block = HomepageBlock.create(alignment: 'left', image: File.open(File.join(Rails.root, 'spec', 'fabricators', 'assets', 'homepage_block_image.png')))
    expect(HomepageBlock.all.count).to eq(0)
  end

  it "returns the alignment class for a left aligned block" do
    @homepage_block = Fabricate(:homepage_block)
    expect(@homepage_block.alignment_class).to eq('block-align-left')
  end

  it "returns the alignment class for a right aligned block" do
    @homepage_block = Fabricate(:homepage_block, alignment: 'right')
    expect(@homepage_block.alignment_class).to eq('block-align-right')
  end
end
