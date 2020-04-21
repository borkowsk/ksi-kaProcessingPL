// World full of agents need method of visualisation on screen/window
////////////////////////////////////////////////////////////////////////////
void visualizeEnv(int[][] env)
{
  noStroke();//Nie ma powodu być w pętli!
  for(int a=0;a<env.length;a++)
   for(int b=0;b<env[a].length;b++)
   {
    //KOLORYZACJA ŚRODOWISKA 
    switch(env[a][b]){
    case Env_FLAT:fill(255);break;
    case Env_WORK:fill(128);break;
    case Env_WORK+1:fill(64);break;//Zajęte miejsca pracy 
    case Env_ROAD:fill(0);break;
    case Env_REST:fill(0,255,0);break;  
    default:fill(255,0,0);break;
    }
    
    rect(b*cwidth,a*cwidth,cwidth,cwidth);//WŁAŚCIWE RYSOWANIE 
   }
}

void visualizeAgents(Agent[][] agents)
{
  noStroke();//Nie ma powodu być w pętli!
  Agent curra;
  for(int a=0;a<agents.length;a++)
   for(int b=0;b<agents[a].length;b++)
   {
    //KOLORYZACJA AGENTA
    if( (curra=agents[a][b]) != null )
    {
      float green=curra.immunity*255;
      switch(curra.state){ 
      case Recovered:  fill(0,255,0);break;//Wyleczony
      case Infected:   fill(255,green,0);break;//Zachorował
      case Susceptible:fill(0,green,255);break;//Podatny
      case Death:      fill(0);break;//Zmarły
      default:         fill(random(255),green,random(255));//Chory
      break;
      } 
      ellipse(b*cwidth,a*cwidth,cwidth,cwidth);//WŁAŚCIWE RYSOWANIE 
    }
    else
    {
      //fill(128);//Mamy rysowanie srodowisko, wiec jak agenta nie ma to nie ma
    }
    
    
   }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
//  https://www.researchgate.net/profile/WOJCIECH_BORKOWSKI - ABM city_of_plague: VISUALISATION
////////////////////////////////////////////////////////////////////////////////////////////////////////
