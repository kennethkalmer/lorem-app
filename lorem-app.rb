Shoes.setup do
  gem "lorem"
end

require 'lorem'

Shoes.app :title => "Lorem App", :width => 500, :height => 350, :margin => 5, :resizable => false do
  background "#EEC".."#996", :curve => 5, :margin => 2
  
  flow :margin => 2 do
    para "Create"
    @number  = edit_line :width => 40, :text => 1
    @options = list_box :items => %w{ paragraphs words characters }, :choose => "paragraphs", :width => 140
    @button = button "Generate lorem"
  end
  stack :margin => 2 do
    @lorem = edit_box :width => 496, :height => 270
  end
  flow :margin => 2 do
    @clip = button "Copy to clipboard"
    button "Close" do
      self.close
    end
  end

  @button.click do
    generated_lorum = Lorem::Base.new( @options.text, @number.text.to_i ).output
    @lorem.text = generated_lorum
  end

  @clip.click  do
    self.clipboard = @lorem.text
  end
end
