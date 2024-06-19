from random import choice
import pandas as pd

# dicionário para trocar nomes por valores numéricos que podem ser usados pelos outros códigos
dict_changes = {'Strength': 0, #atributos
                'Dexterity': 1, 
                'Constitution': 2, 
                'Intelligence': 3, 
                'Wisdom': 4, 
                'Charisma': 5, 
                'Athletics': 0, #perícias
                'Acrobatics': 1,
                'SleightofHand': 2,
                'Stealth': 3,
                'Arcana': 4,
                'History': 5,
                'Investigation': 6,
                'Nature': 7,
                'Religion': 8,
                'Animal': 9,
                'Insight': 10,
                'Medicine': 11,
                'Perception': 12,
                'Survival': 13,
                'Deception ': 14,
                'Intimidation': 15,
                'Performance': 16,
                'Persuasion': 17
                }


def escolhe_classe(atributo_minimo):
    pass