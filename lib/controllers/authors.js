const { Router } = require('express');
const Author = require('../models/Author');
const router = Router();

router
  .get('/', async (req, res) => {
    const author = await Author.getAll();
    res.json(author);
  })
  .get('/:id', async (req, res) => {
    const author = await Author.getById(req.params.id);
    res.json(author);
  })
  .post('/', async (req, res) => {
    // const author = await Author.insert(req.body);
  });

module.exports = router;
