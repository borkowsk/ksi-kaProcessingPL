//Lotka–Volterra equations
//https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations
//https://pl.wikipedia.org/wiki/R%C3%B3wnanie_Lotki-Volterry
//
float X=100;//x is the number of prey (for example, rabbits);
float Y=15;//y is the number of some predator (for example, foxes);

//α, β, γ, δ are positive real parameters describing the interaction of the two species.
float alpha=0.1;//Prey growth
float beta=0.01;//interaction of prey with predators
float gamma=beta/10.0;//the growth of predators depends on the number of pray
float delta=0.1;//the mortality of predators
//α= 0.1 β= 0.01 γ= 0.001 δ= 0.1 is perfectly stable if Xo=100, Yo=10;

float Tstep=0.01;//Time step. As short as possible ;-)

size(1000,500);

stroke(255,0,0);
println("α=",alpha,"β=",beta,"γ=",gamma,"δ=",delta);
////Why i? T used instead!
for(float T=0;T<1000;T+=Tstep)// float TIME used as stearing variable!
{
  float oldX=X;//Local variable is valid only inside its block of code
  //println(T,"X:",X," Y:",Y);
  //How X & Y changes in "infinitely short" time step
  X=X + Tstep * (alpha*X-beta*X*Y);
  Y=Y + Tstep * (gamma*oldX*Y-delta*Y);
  //Visualisation
  stroke(0,255,0);//GREEN for X
  ellipse(T,500-X,3,3);
  stroke(255,0,0);//RED for Y
  ellipse(T,500-Y,3,3);
}

//https://github.com/borkowsk/bookProcessingEN
