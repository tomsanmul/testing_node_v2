const { compareAsc, format } = require( 'date-fns');
const russianLocale = require('date-fns/locale/ru');
const differenceInDays = require('date-fns/differenceInDays');
const differenceInBusinessDays = require('date-fns/differenceInBusinessDays')


//Array[] Dates 'yyyy-MM-dd'
const orderdates = (dates) => dates.sort(compareAsc);
const substring = (s, start, end) => s.substring(start, end);

const formatDate1 = (date) => format(date, 'MM/dd/yyyy');
const formatDate2 = (date) => format(date, 'dd-MM-yyyy');
const formattedDateRu = (date) => format(date, 'MMMM dd, yyyy', { locale: russianLocale });

const daysBetween = (startDate, endDate) => differenceInDays(endDate, startDate);
const workdaysBetween = (startDate, endDate) => differenceInBusinessDays(endDate, startDate);

export{
    orderdates,
    substring,
    formatDate1,
    formatDate2,
    formattedDateRu,
    daysBetween,
    workdaysBetween
}

