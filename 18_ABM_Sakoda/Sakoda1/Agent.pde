// Agent is a one of two central class of each ABM model
//////////////////////////////////////////////////////////////////
int Number_of_identities;//Ile jest wykluczających się tożsamości

class Agent
{
  float identity;//Tożsamość agenta: [1..Number_of_identities]
  float stress;//Stress w aktualnej pozycji [0..1]
  
  Agent()//Constructor of the Agent
  {
    identity=random(1,Number_of_identities);
    stress=0;
  }
}

///////////////////////////////////////////////////////////////////////////////////////////
//  https://www.researchgate.net/profile/WOJCIECH_BORKOWSKI - ABM: AGENT OF SAKODA MODEL
///////////////////////////////////////////////////////////////////////////////////////////
