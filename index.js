const express = require('express');
const db = require('./db');
const app = express()
const port = 3000
app.use(express.json())

//Função para calcular o IMC
function calcularIMC(peso, altura) {
  const imcCalculado = peso / (altura * altura);
  const imc = parseFloat(imcCalculado.toFixed(2));
  let status = ""
  if (imc < 18.5) {
    status = "Abaixo do peso normal";
  } else if (imc < 25) {
    status = "Peso normal";
  } else if (imc < 30) {
    status = "Excesso de Peso";
  } else {
    status = "Obesidade";
  }
  return { imc, status }
}

app.get('/', (req, res) => {
  res.send('Hello World!')
})
app.get('/sextou', (req, res) => {
  res.send('Uhull sextou')
})
app.get('/teste', (req, res) => {
  res.send('atualizou!')
})
app.get('/relatorio', async (req, res) => {
  try {
    const [rows] = await db.execute('select * from pacientes')
    res.status(200).json(rows)

  } catch (error) {
    res.status(500).json(
      {
        mensagem: "Erro ao buscar o relatório.",
        detalhes: error.message
      }
    )
  }
})
//Buscar um paciente pelo seu id
app.get('/paciente/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const [rows] = await db.execute('select * from pacientes where id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json(
        "Paciente não encontrado"
      );
    }
    res.status(200).json(rows[0])
  } catch (error) {
    res.status(500).json(
      {
        mensagem: "Erro ao buscar o paciente.",
        detalhes: error.message
      }
    )
  }

})
//Cadastras novo paciente
app.post('/paciente', async (req, res) => {
  const { nome, idade, altura, peso } = req.body;
  if (!nome || !idade || !altura || !peso) {
    res.status(400).json(
      {
        mensagem: "Verifique se todos os campos foram preenchidos corretamente.",
        detalhes: error.message
      })
  }
  const { imc, status } = calcularIMC(Number(peso), Number(altura));
  try {
    const [result] = await db.execute("INSERT INTO pacientes (nome,idade,altura,peso, imc,status) VALUES (?,?,?,?,?,?)", [nome, idade, altura, peso, imc, status]);
    res.status(201).json({
      id: result.insertId,
      nome,
      idade,
      altura,
      peso,
      imc,
      status
    }
    );
  } catch (error) {
    res.status(500).json(
      {
        mensagem: "Erro ao salvar os dados.",
        detalhes: error.message
      }
    )
  }
});


app.listen(port, () => {
  console.log(`App rodando na porta ${port}`)
})