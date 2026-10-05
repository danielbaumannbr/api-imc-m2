const express = require('express');
const app = express()
const port = 3000
app.use(express.json())

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
    const [rows]= await db.execute('select * from pacientes')
    res.status(200).json(rows)
    
  } catch (error) {
    res.status(500).json(
       {mensagem:"Erro ao buscar o relatório.",
        detalhes:error.message
       } 
    )
  }
})

app.listen(port, () => {
  console.log(`App rodando na porta ${port}`)
})