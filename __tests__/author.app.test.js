const pool = require('../lib/utils/pool');
const setup = require('../data/setup');
const request = require('supertest');
const app = require('../lib/app');

describe('author-routes', () => {
  beforeEach(() => {
    return setup(pool);
  });

  it('Should return the full list of authors', async () => {
    const res = await request(app).get('/authors');
    const expected = [
      { 'name':'Ursula K LeGuin', 'dob':'1929-10-21', 'pob': 'Berkeley, CA' },
      { 'name':'Yasumari Kawabata', 'dob':'1899-06-11', 'pob': 'Osaka, Japan' },
      { 'name':'Franz Kafka', 'dob':'1883-07-03', 'pob': 'Prague, Czechia' },
      { 'name':'Eun Y Kim', 'dob':'1990-09-23', 'pob': 'Seoul, S Korea' },
      { 'name':'Robert T Kiyosaki', 'dob':'1947-04-08', 'pob': 'Hilo, Hawaii' },
      { 'name':'Milan Kundera', 'dob':'1929-04-01', 'pob': 'Brno, Czechoslovakia' }        
    ];
    expect(res.body).toEqual(expected);
  });

  it('Should return author based on id', async () => {
    const res = await request(app).get('/authors/1');

    const LeGuin = {
      name: 'Ursula K LeGuin',
      dob: '1929-10-21',
      pob: 'Berkeley, CA'
    };
    expect(res.body).toEqual(LeGuin);
  });
});
