library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Hipparcos Hertzsprung–Russell Diagram"),
  sidebarPanel(
    h2('Controls'),
	sliderInput('slope', 'Estimated slope, in magnitude per color index',value = 1, min = -10, max = 10, step = 0.1),
	sliderInput('intercept', 'Estimated intercept, in magnitude',value = 0, min = -10, max = 10, step = 0.1)
  ),
  mainPanel(
      h2('About the Hertzsprung–Russell Diagram'),
	  p(paste('The Hertzsprung–Russell (H-R) diagram shows a relationship between',
	  		  'the mass of a star and its luminosity.',
			  'Simply, the more massive a star is, the brighter it is.',
			  'This relationship holds only for stars in the \'Main Sequence\',',
			  'which is the portion of star\'s lifetime during which it',
			  'relies on hydrogen fusion to generate energy.',
			  'Stars spend the majority of their lives in the \'Main Sequence\',',
			  'so most of the stars in this plot from the Hipparcos satellite',
			  'lie in the \'Main Sequence\', but some stars are obviously above or below it.',
			  'The relationship between mass in the X-axis and luminosity in',
			  'the Y-axis is clear.',
			  'Note that luminosity is expressed in terms of magnitude,',
			  'which is a log scale.  Traditionally, smaller values of magnitude',
			  'correspond to higher luminosity.',
			  'Mass is expressed in terms of \'blue-violet color index\',',
			  'which is the difference in luminosity between the blue and violet colors.',
			  'A larger value indicates that the star is more luminuous in blue than',
			  'violet. Technically, this is a measure of color, as opposed to mass.',
			  'However, the color is given by the temperature of the star, which in turn',
			  'depends on the star\'s mass for \'Main Sequence\' stars.',
			  'In the diagram, more massive (hence more violet) stars lie towards the left,',
			  'and more luminous stars (hence low magnitude) stars lie towards the bottom.')),
      p(paste('Use the controls in the left panel to alter the slope and',
	          'location of a line that best captures the mass-luminosity',
			  'relationship in the Hertzprung-Russell diagram.')),
	  plotOutput('hrdiag')
  )
))