class PagesController < ApplicationController

  def home
	@title="Accueil"
  end

  def contact
	@title="Contact"
  end

  def aide
	@title="Aide"
  end

  def about
	@title="A Propos"
  end

end

