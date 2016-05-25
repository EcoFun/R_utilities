makeTransparent<-function(someColor, alpha=100)
{
    newColor<-col2rgb(someColor)
    apply(newColor, 2, function(curcoldata){rgb(red=curcoldata[1], green=curcoldata[2],
    blue=curcoldata[3],alpha=alpha, maxColorValue=255)})
}

#~makeTransparent(2)
#~makeTransparent("red")
#~makeTransparent(rgb(0,0,1))
