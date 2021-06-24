from util import *
import random

def gera_usuario():
    login = input()
    nome = random.choice(nomes)
    cpf = random_cpf()
    senha = random_senha()
    nascimento = random_data()
    instituicao = random.choice(nome_instuicao)
    endereco = random_endereco()

    my_vars = [login, nome, cpf, senha, nascimento, instituicao, endereco]
    my_vars = map(str, my_vars)

    return "('" + "', '".join(my_vars) +  "')"

def gera_usuarios(n):
    ret_str = 'INSERT INTO usuario VALUES\n'
    for _ in range(n-1):
        ret_str += '\t' + gera_usuario() + ',\n'
    ret_str += '\t' + gera_usuario() + ';'
    return ret_str


def gera_perfil(codigo):
    tipo = input()
    return f"({codigo}, '{tipo}')"

def gera_perfis(n=3):
   ret_str = 'INSERT INTO perfil VALUES\n'
   for i in range(n-1):
       ret_str += '\t' + gera_perfil(i) + ',\n'
   ret_str += '\t' + gera_perfil(n-1) + ';'
   return ret_str


def gera_servico(codigo):
    tipo = random_tipo_servico()
    palavras = tipo.split(' ')
    descricao = f'Esse serviço tem como função {palavras[0].lower()} {palavras[1].lower()}'
    return f"({codigo}, '{descricao}', '{tipo}')"


def gera_servicos():
   ret_str = 'INSERT INTO servico VALUES\n'
   for i in range(len(tipo_servico)):
       for j in range(len(nome_servico)):
           tipo = tipo_servico[i] + ' ' + nome_servico[j]
           palavras = tipo.split(' ')
           descricao = f'Esse serviço tem como função {palavras[0].lower()} {palavras[1].lower()}'
           insert_str =  f"({j+i*len(nome_servico)}, '{descricao}', '{tipo}')"
           ret_str += '\t' + insert_str + ',\n'
   #  ret_str += '\t' + gera_servico(n-1) + ';'
   return ret_str


def gera_virus():
   ret_str = 'INSERT INTO virus VALUES\n'
   for i in range(len(nome_virus)):
       nome = nome_virus[i]
       material = random_material_genetico()
       ret_str += f"\t('{nome}', '{material}'),\n"
   return ret_str

def gera_exames(n=10):
    ret_str = 'INSERT INTO ep2.exame VALUES\n'
    for i in range(n):
        ret_str += f"\t({i},'{random.choice(resultado_exames)}','{random.choice(nome_virus)}'),\n"
    return ret_str


def gera_paciente():
    cpf = random_cpf()
    nome = random.choice(nomes)
    endereco = random_endereco()
    nascimento = random_data()
    return f"('{cpf}', '{nome}', '{endereco}', '{nascimento}')"


def gera_pacientes(n=10):
    ret_str = 'INSERT INTO ep2.paciente VALUES\n'
    for _ in range(n):
        ret_str += f"\t{gera_paciente()},\n"
    return ret_str

print(gera_pacientes())
