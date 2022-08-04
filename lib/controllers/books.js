const { Router } = require('express');
const Book = require('../models/Book');
const router = Router();

router
// Get By Id, Make Here
  .get('/:id', async (req, res) => {
    const book = await Book.getById(req.params.id);
    await book.getAuthorsByBookId();
    res.json(book);
  })

//Get All
  .get('/', async (req, res) => {
    const books = await Book.getAll();
    res.json(books);
  })
  .post('/', async (req, res) => {
    const book = await Book.insert(req.body);
    if (req.body.authorIds) {
      await Promise.all(req.body.authorIds.map((id) => book.addAuthorById(id)));
    }
    res.json(book);
  });

  // Post


module.exports = router;
