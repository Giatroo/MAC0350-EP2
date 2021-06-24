nomes = ['Lucas', 'Miguel', 'Ana', 'Camila', 'Eliana', 'Roberto', 'Marina',
         'Giovana', 'Lourenço', 'Eduardo', 'Gabriel', 'Caique', 'Marcos',
         'Davi', 'Luciano', 'Leonardo', 'Gabriela', 'Cris', 'Elisabeti']

nome_virus = ['COVID-19', 'Dengue', 'H1N1', 'Ebola', 'Sars', 'Mars', 'Zika']

tipo_material = ['PCR', 'Anticorpos']

nome_instuicao = ['USP', 'UFMG', 'PUC', 'UNICAMP', 'UNESP', 'Mackenzie',
                  'UFRJ', 'UFABC', 'ITA', 'Unifesp']

area_pesquisa = ['Biomedicina', 'Dermatologia', 'Infectologia', 'Viralogia',
                 'Gastrologia', 'Gastroenterologia', 'Biologia',
                 'Microbiologia', 'Medicina']

resultado_exames = ['Positivo', 'Negativo', 'Infectado', 'Infecção grave',
                    'Infecção Leve', 'Inconclusivo']

ruas = ['Dom Pedro', 'Perimetral', 'do Matão', 'América', 'Luis Pinto Flaquer']

tipo_servico = ['Inserir', 'Remover', 'Visualizar', 'Alterar']
nome_servico = ['Exame', 'Paciente', 'Usuário', 'Amostra', 'Perfil', 'Virus',
                'Tutorando']

def random_cpf():
    import random
    num_digitos = 11

    valor = random.randint(10 ** (num_digitos-1) , 10 ** num_digitos-1);
    valor_str = str(valor)
    return f'{valor_str[:3]}.{valor_str[3:6]}.{valor_str[6:9]}-{valor_str[9:]}'

def random_senha():
    import random
    import string

    return ''.join(random.choices(string.ascii_letters+string.digits+'.!?@#$%', k=random.randint(10,20)))

def random_endereco():
    import random

    endereco = 'Rua ' + str(random.choice(ruas)) + ', número ' + str(random.randint(1,1000))
    if random.randint(0, 1) == 0:
        endereco = endereco + ', ap ' + str(random.randint(1, 100))
    endereco += ', São Paulo, Brasil'

    return endereco

def random_tipo_servico():
    import random

    return random.choice(tipo_servico) + ' ' + random.choice(nome_servico)

def random_material_genetico():
    import random
    atgc = 'ATGC'
    augc = 'AUGC'

    return ''.join(random.choices('ATGC' if random.randint(0,1) else 'AUGC',
                                  k=100))

def random_data():
    import datetime, random

    start_date = datetime.date(1950, 1, 1)
    end_date = datetime.date(2000, 1, 1)

    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = random.randrange(days_between_dates)
    return start_date + datetime.timedelta(days=random_number_of_days)

if __name__ == "__main__":
    print(random_data())
