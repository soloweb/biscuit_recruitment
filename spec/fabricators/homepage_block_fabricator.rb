Fabricator(:homepage_block) do
  title 'Homepage Block Title'
  position 1
  alignment 'left'
  image { File.open(File.join(Rails.root, 'spec', 'fabricators', 'assets', 'homepage_block_image.png'))}
end