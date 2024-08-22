from dataclasses import dataclass, field
from typing import List

@dataclass
class CaracteristicasBasicas:
    name: str = ""
    classe: str = ""
    sub_classe: str = ""
    level: int = 0
    background: str = ""
    lista_informacao_background: List[str] = field(default_factory=list)
    player_name: str = ""
    race: str = ""
    sub_race: str = ""
    alignment: str = ""
    experience: int = 0
    vida: int = 0
    dado_vida: str = ""
    initiative: int = 0
    passive_wisdow: int = 0
    proeficience_bonus: int = 0

@dataclass
class Atributos:
    strength: int = 0 
    dexterity: int = 0
    constitution: int = 0
    intelligence: int = 0
    wisdom: int = 0
    charisma: int = 0

@dataclass
class Modificadores:
    strength: int = 0 
    dexterity: int = 0
    constitution: int = 0
    intelligence: int = 0
    wisdom: int = 0
    charisma: int = 0

@dataclass
class Pesos:
    strength: int = 0
    dexterity: int = 0
    constitution: int = 0
    intelligence: int = 0
    wisdom: int = 0
    charisma: int = 0

@dataclass
class TesteResistencia:
    strength: int = 0
    dexterity: int = 0
    constitution: int = 0
    intelligence: int = 0
    wisdom: int = 0
    charisma: int = 0

@dataclass
class Pericias:
    athletics: int = 0
    acrobatics: int = 0
    sleight_of_hand: int = 0
    stealth: int = 0
    arcana: int = 0
    history: int = 0
    investigation: int = 0
    nature: int = 0
    religion: int = 0
    animal_handling: int = 0
    insight: int = 0
    medicine: int = 0
    perception: int = 0
    survival: int = 0
    deception: int = 0
    intimidation: int = 0
    performance: int = 0
    persuasion: int = 0

class Char:
    def __init__(self, basicas: CaracteristicasBasicas = None, 
                       atributos: Atributos = None, 
                       pesos: Pesos = None,
                       modificadores: Modificadores = None, 
                       teste_resistencia: TesteResistencia = None,
                       pericias: Pericias = None
                        ):
        
        self.basicas = basicas or CaracteristicasBasicas()
        self.atributos = atributos or Atributos()
        self.pesos = pesos or Pesos()
        self.modificadores = modificadores or Modificadores()
        self.teste_resistencia = teste_resistencia or TesteResistencia()
        self.pericias = pericias or Pericias()
    
        