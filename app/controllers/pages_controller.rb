class PagesController < ApplicationController

  def home
	@title="Accueil"
	if connecter?
 	max= User.maximum("films_vu_par_semaine")
   	min= User.minimum("films_vu_par_semaine")
    	moy=User.average("films_vu_par_semaine")
	moy=moy.round(2)
    	File.open("app/assets/images/films.svg", 'w+') { |file| 
		file.write("<?xml version=\"1.0\"?>
				<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" width=\"1000px\" height=\"#{(min+max+20)*10}px\" viewBox=\"0 0 1500 1000\" preserveAspectRatio=\"none\" >
				<desc></desc>
				  <g fill=\"none\" stroke=\"black\" stroke-width=\"5\">
				    <line x1=\"550\" y1=\"10\" x2=\"850\" y2=\"10\"/>
				    <line x1=\"550\" y1=\"#{(max+min+10)*10}\" x2=\"850\" y2=\"#{(max+min+10)*10}\"/>
				  </g>

				  <g stroke=\"black\" stroke-width=\"3\" stroke-dasharray=\"2\" >
					<line x1=\"700\" y1=\"10\" x2=\"700\" y2=\"#{(max+min+10)*10}\"/>
				  </g>
				  <rect x=\"600\" y=\"#{min*10}\" width=\"200\" height=\"#{max*10}\" fill=\"white\" stroke=\"black\" stroke-width=\"5\"/>

				  <g fill=\"none\" stroke=\"black\" stroke-width=\"5\">
				    <line x1=\"550\" y1=\"#{moy*10}\" x2=\"850\" y2=\"#{moy*10}\"/>
				  </g>

				  <text x=\"855\" y=\"#{min*10}\" font-size=\"25pt\">
					#{min}
				  </text>

				  <text x=\"855\" y=\"#{moy*10}\" font-size=\"25pt\">
					#{moy}
				  </text>

				  <text x=\"855\" y=\"#{(max+min)*10}\" font-size=\"25pt\">
					#{max}
				  </text>

				  <text x=\"855\" y=\"#{(max+min+10)*10}\" font-size=\"25pt\">
					#{min+max}
				  </text>
				  <text x=\"855\" y=\"25\" font-size=\"25pt\">
					0
				  </text>
				</svg>

			    ") 
	}
	end
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

