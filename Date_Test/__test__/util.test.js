
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
  
test('Test function in order to see if it organizes the array correctlyt', () => {
    expect(orderdates(dates)).toStrictEqual([new Date(1987, 1, 11), new Date(1989, 6, 10), new Date(1995, 6, 2)]);
  });


const text = "Hello World";
test('Test function in order to see if it extracts the characters between the two positions of the string correctly', () => {
    expect(substring(text, 6, 11)).toBe("World");
  });
  
  
const date1 = new Date("2022-12-22");
test('Test function in order to see if it formats the date correctly', () => {
    expect(formatDate1(date1)).toStrictEqual('12/22/2022');
  });
test('Test function in order to see if it formats the date correctly', () => {
    expect(formatDate2(date1)).toStrictEqual('22-12-2022');
  });
test('Test function in order to see if it formats the date to a Russian date correctly', () => {
    expect(formattedDateRu(date1)).toStrictEqual('декабря 22, 2022');
  });


test('Test function in order to see if it shows all the days between the two dates correctly', () => {
    expect(daysBetween(new Date(2022, 12, 22), new Date(2022, 12, 27))).toBe(5);
  });

test('Test function in order to see if it shows all the workdays between the two dates correctly', () => {
    expect(workdaysBetween(new Date(2022, 12, 22), new Date(2022, 12, 27))).toBe(4);
  });

