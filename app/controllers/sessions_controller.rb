class SessionsController < ApplicationController
  def new
    @titre = "S'identifier"
  end

  def create
	  user = User.authenticate(params[:session][:email], params[:session][:password])

	  if user.nil?
	    # Crée un message d'erreur et rend le formulaire d'identification.
	      flash.now[:error] = "Combinaison Email/Mot de passe invalide."
	      @titre = "S'identifier"
	      render 'new'
	  else
	    # Authentifie l'utilisateur et redirige vers la page d'affichage.
	      connexion user
              rediriger_precedent_ou user
	  end
  end

  def destroy
    deconnexion
    redirect_to root_path
  end
end
