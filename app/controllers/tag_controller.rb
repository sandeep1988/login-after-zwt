class TagController < ApplicationController
  def index
  	@tags = Tag.all.collect(&:v_title).uniq
  end
end	