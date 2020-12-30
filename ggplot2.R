##### Environment construction #####

install.packages('tidyverse')

library(tidyverse)

##### Graph types #####
data()
mpg
ggplot(mpg,aes(x=displ,y=hwy)) + 
  geom_point()
ggplot(economics, aes(date, unemploy)) + geom_line()
ggplot(mpg, aes(cty)) + geom_histogram()

##### Color,shape,Size #####
ggplot(mpg, aes(displ, hwy, colour = class)) + 
  geom_point()
ggplot(mpg, aes(displ, hwy)) + geom_point(aes(colour = "blue")) #pinkred
ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "blue") #blue

ggplot(mpg, aes(displ, hwy,shape = class)) + geom_point()
ggplot(mpg, aes(displ, hwy,size = cty)) + geom_point()
ggplot(mpg, aes(displ, hwy,size = cty,colour = class)) + geom_point()

###### Facet #####
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  facet_wrap(~class)
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  facet_wrap(~cyl)
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(vars(cyl, drv))

##### Geom Plot #####
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth()
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(se = F)
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(span = 0.2)

library(mgcv)
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(method = "gam", formula = y ~ s(x))
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(method = "gam", formula = y ~ s(x,bs = 'cs')) # for large data
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(method = "lm")
library(MASS)
ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth(method = "rlm") # robust,ignore outlier

