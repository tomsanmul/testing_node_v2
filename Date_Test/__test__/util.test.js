const { compareAsc, format } = require( 'date-fns');
const russianLocale = require('date-fns/locale/ru');
const differenceInDays = require('date-fns/differenceInDays');
const differenceInBusinessDays = require('date-fns/differenceInBusinessDays')


const {
    orderdates,
   substring,
   formatDate1,
   formatDate2,
   formattedDateRu,
   daysBetween,
   workdaysBetween
  } = require('../date_test/util');
  
  
  
  const dates = [
    new Date(1995, 6, 2),
    new Date(1987, 1, 11),
    new Date(1989, 6, 10),
  ]
  

test('Test orderdates', () => {
    expect(orderdates(dates)).toStrictEqual([new Date(1987, 1, 11), new Date(1989, 6, 10), new Date(1995, 6, 2)]);
  });
  
  
test('daysBetween', () => {
    expect(daysBetween([new Date(1987, 1, 11), new Date(1987, 1, 12)])).toBe(1);
  });
  
  
