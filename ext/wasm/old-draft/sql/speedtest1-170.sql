-- begin test 170 2500 SELECTS, text BETWEEN, indexed
BEGIN;
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred ninety two' AND ('eight thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand ninety six' AND ('four thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred eighty eight' AND ('twelve thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand forty eight' AND ('two thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred forty' AND ('ten thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred forty four' AND ('six thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred thirty six' AND ('fourteen thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand twenty four' AND ('one thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred sixteen' AND ('nine thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred twenty' AND ('five thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred twelve' AND ('thirteen thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seventy two' AND ('three thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred sixty four' AND ('eleven thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred sixty eight' AND ('seven thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred sixty' AND ('fifteen thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred twelve' AND ('five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred four' AND ('eight thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred eight' AND ('four thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred' AND ('twelve thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred sixty' AND ('two thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred fifty two' AND ('ten thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred fifty six' AND ('six thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred forty eight' AND ('fourteen thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred thirty six' AND ('one thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred twenty eight' AND ('nine thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred thirty two' AND ('five thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred twenty four' AND ('thirteen thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred eighty four' AND ('three thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred seventy six' AND ('eleven thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred eighty' AND ('seven thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred seventy two' AND ('fifteen thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred fifty six' AND ('two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred forty eight' AND ('eight thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred fifty two' AND ('four thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred forty four' AND ('twelve thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred four' AND ('two thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred ninety six' AND ('ten thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred' AND ('six thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred ninety two' AND ('fourteen thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred eighty' AND ('one thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred seventy two' AND ('nine thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred seventy six' AND ('five thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred sixty eight' AND ('thirteen thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred twenty eight' AND ('three thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred twenty' AND ('eleven thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred twenty four' AND ('seven thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred sixteen' AND ('fifteen thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred sixty eight' AND ('seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred sixty' AND ('eight thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred sixty four' AND ('four thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand fifty six' AND ('thirteen thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred sixteen' AND ('two thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight' AND ('eleven thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred twelve' AND ('six thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred four' AND ('fifteen thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred ninety two' AND ('one thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred eighty four' AND ('nine thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred eighty eight' AND ('five thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eighty' AND ('fourteen thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred forty' AND ('three thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand thirty two' AND ('twelve thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred thirty six' AND ('seven thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred twenty eight' AND ('sixteen thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred twenty eight' AND ('one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred twenty' AND ('eight thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred twenty four' AND ('four thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred sixteen' AND ('twelve thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred seventy six' AND ('two thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred sixty eight' AND ('ten thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred seventy two' AND ('six thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred sixty four' AND ('fourteen thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred fifty two' AND ('one thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred forty four' AND ('nine thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred forty eight' AND ('five thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred forty' AND ('thirteen thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred' AND ('three thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred ninety two' AND ('eleven thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred ninety six' AND ('seven thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred eighty eight' AND ('fifteen thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred forty' AND ('six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred thirty two' AND ('eight thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred thirty six' AND ('four thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred twenty eight' AND ('twelve thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred eighty eight' AND ('two thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred eighty' AND ('ten thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred eighty four' AND ('six thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred seventy six' AND ('fourteen thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred sixty four' AND ('one thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred fifty six' AND ('nine thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred sixty' AND ('five thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred fifty two' AND ('thirteen thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred twelve' AND ('three thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred four' AND ('eleven thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred eight' AND ('seven thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand' AND ('sixteen thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred eighty four' AND ('three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred seventy six' AND ('eight thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred eighty' AND ('four thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred seventy two' AND ('twelve thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred thirty two' AND ('two thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred twenty four' AND ('ten thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred twenty eight' AND ('six thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred twenty' AND ('fourteen thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred eight' AND ('one thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred' AND ('nine thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred four' AND ('five thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred ninety six' AND ('thirteen thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred fifty six' AND ('three thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred forty eight' AND ('eleven thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred fifty two' AND ('seven thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred forty four' AND ('fifteen thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred ninety six' AND ('eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eighty eight' AND ('nine thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred ninety two' AND ('four thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred eighty four' AND ('thirteen thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred forty four' AND ('two thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred thirty six' AND ('eleven thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand forty' AND ('seven thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred thirty two' AND ('fifteen thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred twenty' AND ('one thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred twelve' AND ('ten thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand sixteen' AND ('six thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred eight' AND ('fourteen thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred sixty eight' AND ('three thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred sixty' AND ('twelve thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand sixty four' AND ('eight thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred fifty six' AND ('sixteen thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixty four' AND ('sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred fifty six' AND ('eight thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred sixty' AND ('four thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred fifty two' AND ('twelve thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred twelve' AND ('two thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred four' AND ('ten thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred eight' AND ('six thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred' AND ('fourteen thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eighty eight' AND ('one thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred eighty' AND ('nine thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred eighty four' AND ('five thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred seventy six' AND ('thirteen thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred thirty six' AND ('three thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred twenty eight' AND ('eleven thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred thirty two' AND ('seven thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred twenty four' AND ('fifteen thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred seventy six' AND ('five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred sixty eight' AND ('eight thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred seventy two' AND ('four thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred sixty four' AND ('twelve thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred twenty four' AND ('two thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred sixteen' AND ('ten thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred twenty' AND ('six thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred twelve' AND ('fourteen thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred' AND ('one thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred ninety two' AND ('nine thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred ninety six' AND ('five thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred eighty eight' AND ('thirteen thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred forty eight' AND ('three thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred forty' AND ('eleven thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred forty four' AND ('seven thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred thirty six' AND ('fifteen thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred twenty' AND ('three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred twelve' AND ('eight thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred sixteen' AND ('four thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred eight' AND ('twelve thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred sixty eight' AND ('two thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred sixty' AND ('ten thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred sixty four' AND ('six thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred fifty six' AND ('fourteen thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred forty four' AND ('one thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred thirty six' AND ('nine thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred forty' AND ('five thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred thirty two' AND ('thirteen thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred ninety two' AND ('three thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred eighty four' AND ('eleven thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred eighty eight' AND ('seven thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred eighty' AND ('fifteen thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred thirty two' AND ('eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand twenty four' AND ('nine thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred twenty eight' AND ('four thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred twenty' AND ('thirteen thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred eighty' AND ('two thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seventy two' AND ('eleven thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred seventy six' AND ('six thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred sixty eight' AND ('fifteen thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred fifty six' AND ('one thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand forty eight' AND ('ten thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred fifty two' AND ('five thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred forty four' AND ('fourteen thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred four' AND ('three thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand ninety six' AND ('twelve thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand' AND ('eight thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred ninety two' AND ('sixteen thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred ninety two' AND ('one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred eighty four' AND ('eight thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred eighty eight' AND ('four thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred eighty' AND ('twelve thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred forty' AND ('two thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred thirty two' AND ('ten thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred thirty six' AND ('six thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred twenty eight' AND ('fourteen thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred sixteen' AND ('one thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred eight' AND ('nine thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred twelve' AND ('five thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred four' AND ('thirteen thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred sixty four' AND ('three thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred fifty six' AND ('eleven thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred sixty' AND ('seven thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred fifty two' AND ('fifteen thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred four' AND ('seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred ninety six' AND ('eight thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred' AND ('four thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred ninety two' AND ('twelve thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred fifty two' AND ('two thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred forty four' AND ('ten thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred forty eight' AND ('six thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand forty' AND ('fifteen thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred twenty eight' AND ('one thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred twenty' AND ('nine thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred twenty four' AND ('five thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand sixteen' AND ('fourteen thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred seventy six' AND ('three thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred sixty eight' AND ('eleven thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred seventy two' AND ('seven thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand sixty four' AND ('sixteen thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred forty eight' AND ('four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred forty' AND ('eight thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred forty four' AND ('four thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred thirty six' AND ('twelve thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred ninety six' AND ('two thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred eighty eight' AND ('ten thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred ninety two' AND ('six thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred eighty four' AND ('fourteen thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred seventy two' AND ('one thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred sixty four' AND ('nine thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred sixty eight' AND ('five thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred sixty' AND ('thirteen thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred twenty' AND ('three thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred twelve' AND ('eleven thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred sixteen' AND ('seven thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred eight' AND ('fifteen thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred sixty' AND ('nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred fifty two' AND ('nine thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand fifty six' AND ('five thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred forty eight' AND ('thirteen thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight' AND ('three thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred' AND ('eleven thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred four' AND ('seven thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred ninety six' AND ('fifteen thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred eighty four' AND ('one thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred seventy six' AND ('ten thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eighty' AND ('six thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred seventy two' AND ('fourteen thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand thirty two' AND ('four thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred twenty four' AND ('twelve thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred twenty eight' AND ('eight thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred twenty' AND ('sixteen thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirty two' AND ('thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred twenty four' AND ('eight thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred twenty eight' AND ('four thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred twenty' AND ('twelve thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eighty' AND ('two thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred seventy two' AND ('ten thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred seventy six' AND ('six thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred sixty eight' AND ('fourteen thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand fifty six' AND ('one thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred forty eight' AND ('nine thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred fifty two' AND ('five thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred forty four' AND ('thirteen thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred four' AND ('three thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred ninety six' AND ('eleven thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred' AND ('seven thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred ninety two' AND ('fifteen thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred forty four' AND ('five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred thirty six' AND ('eight thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred forty' AND ('four thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred thirty two' AND ('twelve thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred ninety two' AND ('two thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred eighty four' AND ('ten thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred eighty eight' AND ('six thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred eighty' AND ('fourteen thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred sixty eight' AND ('one thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred sixty' AND ('nine thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred sixty four' AND ('five thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred fifty six' AND ('thirteen thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred sixteen' AND ('three thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred eight' AND ('eleven thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred twelve' AND ('seven thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred four' AND ('fifteen thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred eighty eight' AND ('two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred eighty' AND ('eight thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred eighty four' AND ('four thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred seventy six' AND ('twelve thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred thirty six' AND ('two thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred twenty eight' AND ('ten thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred thirty two' AND ('six thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred twenty four' AND ('fourteen thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred twelve' AND ('one thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred four' AND ('nine thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred eight' AND ('five thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred' AND ('thirteen thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred sixty' AND ('three thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred fifty two' AND ('eleven thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred fifty six' AND ('seven thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred forty eight' AND ('fifteen thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred' AND ('eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred ninety two' AND ('eight thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred ninety six' AND ('four thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eighty eight' AND ('thirteen thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred forty eight' AND ('two thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand forty' AND ('eleven thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred forty four' AND ('six thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred thirty six' AND ('fifteen thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred twenty four' AND ('one thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand sixteen' AND ('ten thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred twenty' AND ('five thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred twelve' AND ('fourteen thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred seventy two' AND ('three thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand sixty four' AND ('twelve thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred sixty eight' AND ('seven thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred sixty' AND ('sixteen thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred sixty' AND ('one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred fifty two' AND ('eight thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred fifty six' AND ('four thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred forty eight' AND ('twelve thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred eight' AND ('two thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred' AND ('ten thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred four' AND ('six thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred ninety six' AND ('fourteen thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred eighty four' AND ('one thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred seventy six' AND ('nine thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred eighty' AND ('five thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred seventy two' AND ('thirteen thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred thirty two' AND ('three thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred twenty four' AND ('eleven thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred twenty eight' AND ('seven thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred twenty' AND ('fifteen thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred seventy two' AND ('six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred sixty four' AND ('eight thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred sixty eight' AND ('four thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred sixty' AND ('twelve thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred twenty' AND ('two thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred twelve' AND ('ten thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred sixteen' AND ('six thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight' AND ('fifteen thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred ninety six' AND ('one thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred eighty eight' AND ('nine thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred ninety two' AND ('five thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred eighty four' AND ('thirteen thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred forty four' AND ('three thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred thirty six' AND ('eleven thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred forty' AND ('seven thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand thirty two' AND ('sixteen thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred sixteen' AND ('four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred eight' AND ('eight thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred twelve' AND ('four thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred four' AND ('twelve thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred sixty four' AND ('two thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred fifty six' AND ('ten thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred sixty' AND ('six thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred fifty two' AND ('fourteen thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred forty' AND ('one thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred thirty two' AND ('nine thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred thirty six' AND ('five thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred twenty eight' AND ('thirteen thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred eighty eight' AND ('three thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred eighty' AND ('eleven thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred eighty four' AND ('seven thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred seventy six' AND ('fifteen thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred twenty eight' AND ('nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred twenty' AND ('nine thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand twenty four' AND ('five thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred sixteen' AND ('thirteen thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred seventy six' AND ('two thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred sixty eight' AND ('eleven thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seventy two' AND ('seven thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred sixty four' AND ('fifteen thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred fifty two' AND ('one thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred forty four' AND ('ten thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand forty eight' AND ('six thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred forty' AND ('fourteen thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand' AND ('four thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred ninety two' AND ('twelve thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand ninety six' AND ('eight thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred eighty eight' AND ('sixteen thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ninety six' AND ('ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred eighty eight' AND ('eight thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred ninety two' AND ('four thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred eighty four' AND ('twelve thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred forty four' AND ('two thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred thirty six' AND ('ten thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred forty' AND ('six thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred thirty two' AND ('fourteen thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred twenty' AND ('one thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred twelve' AND ('nine thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred sixteen' AND ('five thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred eight' AND ('thirteen thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred sixty eight' AND ('three thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred sixty' AND ('eleven thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred sixty four' AND ('seven thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred fifty six' AND ('fifteen thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred eight' AND ('six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred' AND ('eight thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred four' AND ('four thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred ninety six' AND ('twelve thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred fifty six' AND ('two thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred forty eight' AND ('ten thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred fifty two' AND ('six thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred forty four' AND ('fourteen thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred thirty two' AND ('one thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred twenty four' AND ('nine thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred twenty eight' AND ('five thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred twenty' AND ('thirteen thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred eighty' AND ('three thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred seventy two' AND ('eleven thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred seventy six' AND ('seven thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred sixty eight' AND ('fifteen thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred fifty two' AND ('three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred forty four' AND ('eight thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred forty eight' AND ('four thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred forty' AND ('twelve thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred' AND ('two thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred ninety two' AND ('ten thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred ninety six' AND ('six thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred eighty eight' AND ('fourteen thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred seventy six' AND ('one thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred sixty eight' AND ('nine thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred seventy two' AND ('five thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred sixty four' AND ('thirteen thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred twenty four' AND ('three thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred sixteen' AND ('eleven thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred twenty' AND ('seven thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred twelve' AND ('fifteen thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred sixty four' AND ('eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand fifty six' AND ('nine thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred sixty' AND ('four thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred fifty two' AND ('thirteen thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred twelve' AND ('two thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred four' AND ('eleven thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight' AND ('seven thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred' AND ('fifteen thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred eighty eight' AND ('one thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eighty' AND ('ten thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred eighty four' AND ('five thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred seventy six' AND ('fourteen thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred thirty six' AND ('three thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred twenty eight' AND ('twelve thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand thirty two' AND ('eight thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred twenty four' AND ('sixteen thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred twenty four' AND ('two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred sixteen' AND ('eight thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred twenty' AND ('four thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred twelve' AND ('twelve thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred seventy two' AND ('two thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred sixty four' AND ('ten thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred sixty eight' AND ('six thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred sixty' AND ('fourteen thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred forty eight' AND ('one thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred forty' AND ('nine thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred forty four' AND ('five thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred thirty six' AND ('thirteen thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred ninety six' AND ('three thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred eighty eight' AND ('eleven thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred ninety two' AND ('seven thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred eighty four' AND ('fifteen thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred thirty six' AND ('seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred twenty eight' AND ('eight thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred thirty two' AND ('four thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand twenty four' AND ('thirteen thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred eighty four' AND ('two thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred seventy six' AND ('ten thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred eighty' AND ('six thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seventy two' AND ('fifteen thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred sixty' AND ('one thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred fifty two' AND ('nine thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred fifty six' AND ('five thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand forty eight' AND ('fourteen thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred eight' AND ('three thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand' AND ('twelve thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred four' AND ('seven thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand ninety six' AND ('sixteen thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred eighty' AND ('four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred seventy two' AND ('eight thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred seventy six' AND ('four thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred sixty eight' AND ('twelve thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred twenty eight' AND ('two thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred twenty' AND ('ten thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred twenty four' AND ('six thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred sixteen' AND ('fourteen thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred four' AND ('one thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred ninety six' AND ('nine thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred' AND ('five thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred ninety two' AND ('thirteen thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred fifty two' AND ('three thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred forty four' AND ('eleven thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred forty eight' AND ('seven thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred forty' AND ('fifteen thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred ninety two' AND ('nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred eighty four' AND ('nine thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eighty eight' AND ('five thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred eighty' AND ('thirteen thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand forty' AND ('three thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred thirty two' AND ('eleven thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred thirty six' AND ('seven thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred twenty eight' AND ('fifteen thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand sixteen' AND ('two thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred eight' AND ('ten thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred twelve' AND ('six thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred four' AND ('fourteen thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand sixty four' AND ('four thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred fifty six' AND ('twelve thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred sixty' AND ('eight thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred fifty two' AND ('sixteen thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen' AND ('sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred eight' AND ('eight thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred twelve' AND ('four thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred four' AND ('twelve thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand sixty four' AND ('two thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred fifty six' AND ('ten thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred sixty' AND ('six thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred fifty two' AND ('fourteen thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand forty' AND ('one thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred thirty two' AND ('nine thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred thirty six' AND ('five thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred twenty eight' AND ('thirteen thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eighty eight' AND ('three thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred eighty' AND ('eleven thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred eighty four' AND ('seven thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred seventy six' AND ('fifteen thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred twenty eight' AND ('five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred twenty' AND ('eight thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred twenty four' AND ('four thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred sixteen' AND ('twelve thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred seventy six' AND ('two thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred sixty eight' AND ('ten thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred seventy two' AND ('six thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred sixty four' AND ('fourteen thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred fifty two' AND ('one thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred forty four' AND ('nine thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred forty eight' AND ('five thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred forty' AND ('thirteen thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred' AND ('three thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred ninety two' AND ('eleven thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred ninety six' AND ('seven thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred eighty eight' AND ('fifteen thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred seventy two' AND ('two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred sixty four' AND ('eight thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred sixty eight' AND ('four thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred sixty' AND ('twelve thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred twenty' AND ('two thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred twelve' AND ('ten thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred sixteen' AND ('six thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred eight' AND ('fourteen thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred ninety six' AND ('one thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred eighty eight' AND ('nine thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred ninety two' AND ('five thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred eighty four' AND ('thirteen thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred forty four' AND ('three thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred thirty six' AND ('eleven thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred forty' AND ('seven thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred thirty two' AND ('fifteen thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred eighty four' AND ('seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred seventy six' AND ('eight thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred eighty' AND ('four thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seventy two' AND ('thirteen thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred thirty two' AND ('two thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand twenty four' AND ('eleven thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred twenty eight' AND ('six thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred twenty' AND ('fifteen thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred eight' AND ('one thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand' AND ('ten thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred four' AND ('five thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand ninety six' AND ('fourteen thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred fifty six' AND ('three thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand forty eight' AND ('twelve thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred fifty two' AND ('seven thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred forty four' AND ('sixteen thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred forty four' AND ('one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred thirty six' AND ('eight thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred forty' AND ('four thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred thirty two' AND ('twelve thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred ninety two' AND ('two thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred eighty four' AND ('ten thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred eighty eight' AND ('six thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred eighty' AND ('fourteen thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred sixty eight' AND ('one thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred sixty' AND ('nine thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred sixty four' AND ('five thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred fifty six' AND ('thirteen thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred sixteen' AND ('three thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred eight' AND ('eleven thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred twelve' AND ('seven thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred four' AND ('fifteen thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred fifty six' AND ('six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred forty eight' AND ('eight thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred fifty two' AND ('four thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred forty four' AND ('twelve thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred four' AND ('two thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred ninety six' AND ('ten thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred' AND ('six thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred ninety two' AND ('fourteen thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred eighty' AND ('one thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred seventy two' AND ('nine thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred seventy six' AND ('five thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred sixty eight' AND ('thirteen thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred twenty eight' AND ('three thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred twenty' AND ('eleven thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred twenty four' AND ('seven thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand sixteen' AND ('sixteen thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred' AND ('four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred ninety two' AND ('eight thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred ninety six' AND ('four thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred eighty eight' AND ('twelve thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred forty eight' AND ('two thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred forty' AND ('ten thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred forty four' AND ('six thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred thirty six' AND ('fourteen thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred twenty four' AND ('one thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred sixteen' AND ('nine thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred twenty' AND ('five thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred twelve' AND ('thirteen thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred seventy two' AND ('three thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred sixty four' AND ('eleven thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred sixty eight' AND ('seven thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred sixty' AND ('fifteen thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred twelve' AND ('nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred four' AND ('nine thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight' AND ('five thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred' AND ('thirteen thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred sixty' AND ('two thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred fifty two' AND ('eleven thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand fifty six' AND ('seven thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred forty eight' AND ('fifteen thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred thirty six' AND ('one thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred twenty eight' AND ('ten thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand thirty two' AND ('six thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred twenty four' AND ('fourteen thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred eighty four' AND ('three thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred seventy six' AND ('twelve thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eighty' AND ('eight thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred seventy two' AND ('sixteen thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eighty' AND ('eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred seventy two' AND ('eight thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred seventy six' AND ('four thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred sixty eight' AND ('twelve thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred twenty eight' AND ('two thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred twenty' AND ('ten thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred twenty four' AND ('six thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred sixteen' AND ('fourteen thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred four' AND ('one thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred ninety six' AND ('nine thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred' AND ('five thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred ninety two' AND ('thirteen thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred fifty two' AND ('three thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred forty four' AND ('eleven thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred forty eight' AND ('seven thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred forty' AND ('fifteen thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred ninety two' AND ('five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred eighty four' AND ('eight thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred eighty eight' AND ('four thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred eighty' AND ('twelve thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred forty' AND ('two thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred thirty two' AND ('ten thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred thirty six' AND ('six thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred twenty eight' AND ('fourteen thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred sixteen' AND ('one thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred eight' AND ('nine thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred twelve' AND ('five thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred four' AND ('thirteen thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred sixty four' AND ('three thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred fifty six' AND ('eleven thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred sixty' AND ('seven thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred fifty two' AND ('fifteen thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred thirty six' AND ('three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred twenty eight' AND ('eight thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred thirty two' AND ('four thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred twenty four' AND ('twelve thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred eighty four' AND ('two thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred seventy six' AND ('ten thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred eighty' AND ('six thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred seventy two' AND ('fourteen thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred sixty' AND ('one thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred fifty two' AND ('nine thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred fifty six' AND ('five thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred forty eight' AND ('thirteen thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred eight' AND ('three thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred' AND ('eleven thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred four' AND ('seven thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred ninety six' AND ('fifteen thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred forty eight' AND ('eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand forty' AND ('nine thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred forty four' AND ('four thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred thirty six' AND ('thirteen thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred ninety six' AND ('two thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eighty eight' AND ('eleven thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred ninety two' AND ('six thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred eighty four' AND ('fifteen thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred seventy two' AND ('one thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand sixty four' AND ('ten thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred sixty eight' AND ('five thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred sixty' AND ('fourteen thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred twenty' AND ('three thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred twelve' AND ('twelve thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand sixteen' AND ('eight thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred eight' AND ('sixteen thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred eight' AND ('two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred' AND ('eight thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred four' AND ('four thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred ninety six' AND ('twelve thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred fifty six' AND ('two thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred forty eight' AND ('ten thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred fifty two' AND ('six thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred forty four' AND ('fourteen thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred thirty two' AND ('one thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred twenty four' AND ('nine thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred twenty eight' AND ('five thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred twenty' AND ('thirteen thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred eighty' AND ('three thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred seventy two' AND ('eleven thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred seventy six' AND ('seven thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred sixty eight' AND ('fifteen thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred twenty' AND ('seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred twelve' AND ('eight thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred sixteen' AND ('four thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight' AND ('thirteen thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred sixty eight' AND ('two thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred sixty' AND ('ten thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred sixty four' AND ('six thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand fifty six' AND ('fifteen thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred forty four' AND ('one thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred thirty six' AND ('nine thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred forty' AND ('five thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand thirty two' AND ('fourteen thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred ninety two' AND ('three thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred eighty four' AND ('eleven thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred eighty eight' AND ('seven thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand eighty' AND ('sixteen thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred sixty four' AND ('four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred fifty six' AND ('eight thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred sixty' AND ('four thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred fifty two' AND ('twelve thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred twelve' AND ('two thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred four' AND ('ten thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred eight' AND ('six thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred' AND ('fourteen thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred eighty eight' AND ('one thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred eighty' AND ('nine thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred eighty four' AND ('five thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred seventy six' AND ('thirteen thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred thirty six' AND ('three thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred twenty eight' AND ('eleven thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred thirty two' AND ('seven thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred twenty four' AND ('fifteen thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred seventy six' AND ('nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred sixty eight' AND ('nine thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seventy two' AND ('five thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred sixty four' AND ('thirteen thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand twenty four' AND ('three thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred sixteen' AND ('eleven thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred twenty' AND ('seven thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred twelve' AND ('fifteen thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand' AND ('two thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred ninety two' AND ('ten thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand ninety six' AND ('six thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred eighty eight' AND ('fourteen thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand forty eight' AND ('four thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred forty' AND ('twelve thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred forty four' AND ('eight thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred thirty six' AND ('sixteen thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'forty eight' AND ('forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred forty' AND ('eight thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred forty four' AND ('four thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred thirty six' AND ('twelve thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand ninety six' AND ('two thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred eighty eight' AND ('ten thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred ninety two' AND ('six thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred eighty four' AND ('fourteen thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seventy two' AND ('one thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred sixty four' AND ('nine thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred sixty eight' AND ('five thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred sixty' AND ('thirteen thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred twenty' AND ('three thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred twelve' AND ('eleven thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred sixteen' AND ('seven thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred eight' AND ('fifteen thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred sixty' AND ('five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred fifty two' AND ('eight thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred fifty six' AND ('four thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred forty eight' AND ('twelve thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred eight' AND ('two thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred' AND ('ten thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred four' AND ('six thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred ninety six' AND ('fourteen thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred eighty four' AND ('one thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred seventy six' AND ('nine thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred eighty' AND ('five thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred seventy two' AND ('thirteen thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred thirty two' AND ('three thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred twenty four' AND ('eleven thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred twenty eight' AND ('seven thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred twenty' AND ('fifteen thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred four' AND ('three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred ninety six' AND ('eight thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred' AND ('four thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred ninety two' AND ('twelve thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred fifty two' AND ('two thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred forty four' AND ('ten thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred forty eight' AND ('six thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred forty' AND ('fourteen thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred twenty eight' AND ('one thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred twenty' AND ('nine thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred twenty four' AND ('five thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred sixteen' AND ('thirteen thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred seventy six' AND ('three thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred sixty eight' AND ('eleven thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred seventy two' AND ('seven thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred sixty four' AND ('fifteen thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred sixteen' AND ('eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight' AND ('nine thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred twelve' AND ('four thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred four' AND ('thirteen thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred sixty four' AND ('two thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand fifty six' AND ('eleven thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred sixty' AND ('six thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred fifty two' AND ('fifteen thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred forty' AND ('one thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand thirty two' AND ('ten thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred thirty six' AND ('five thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred twenty eight' AND ('fourteen thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred eighty eight' AND ('three thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eighty' AND ('twelve thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred eighty four' AND ('seven thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred seventy six' AND ('sixteen thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred seventy six' AND ('one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred sixty eight' AND ('eight thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred seventy two' AND ('four thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred sixty four' AND ('twelve thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred twenty four' AND ('two thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred sixteen' AND ('ten thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred twenty' AND ('six thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred twelve' AND ('fourteen thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred' AND ('one thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred ninety two' AND ('nine thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred ninety six' AND ('five thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred eighty eight' AND ('thirteen thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred forty eight' AND ('three thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred forty' AND ('eleven thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred forty four' AND ('seven thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred thirty six' AND ('fifteen thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred eighty eight' AND ('six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred eighty' AND ('eight thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred eighty four' AND ('four thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred seventy six' AND ('twelve thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred thirty six' AND ('two thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred twenty eight' AND ('ten thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred thirty two' AND ('six thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand twenty four' AND ('fifteen thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred twelve' AND ('one thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred four' AND ('nine thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred eight' AND ('five thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand' AND ('fourteen thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred sixty' AND ('three thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred fifty two' AND ('eleven thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred fifty six' AND ('seven thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand forty eight' AND ('sixteen thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred thirty two' AND ('four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred twenty four' AND ('eight thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred twenty eight' AND ('four thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred twenty' AND ('twelve thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred eighty' AND ('two thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred seventy two' AND ('ten thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred seventy six' AND ('six thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred sixty eight' AND ('fourteen thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred fifty six' AND ('one thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred forty eight' AND ('nine thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred fifty two' AND ('five thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred forty four' AND ('thirteen thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred four' AND ('three thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred ninety six' AND ('eleven thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred' AND ('seven thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred ninety two' AND ('fifteen thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred forty four' AND ('nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred thirty six' AND ('nine thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand forty' AND ('five thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred thirty two' AND ('thirteen thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred ninety two' AND ('two thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred eighty four' AND ('eleven thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eighty eight' AND ('seven thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred eighty' AND ('fifteen thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred sixty eight' AND ('one thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred sixty' AND ('ten thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand sixty four' AND ('six thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred fifty six' AND ('fourteen thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand sixteen' AND ('four thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred eight' AND ('twelve thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred twelve' AND ('eight thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred four' AND ('sixteen thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred twelve' AND ('one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred four' AND ('eight thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred eight' AND ('four thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred' AND ('twelve thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred sixty' AND ('two thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred fifty two' AND ('ten thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred fifty six' AND ('six thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred forty eight' AND ('fourteen thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred thirty six' AND ('one thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred twenty eight' AND ('nine thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred thirty two' AND ('five thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred twenty four' AND ('thirteen thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred eighty four' AND ('three thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred seventy six' AND ('eleven thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred eighty' AND ('seven thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred seventy two' AND ('fifteen thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred twenty four' AND ('six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred sixteen' AND ('eight thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred twenty' AND ('four thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred twelve' AND ('twelve thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred seventy two' AND ('two thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred sixty four' AND ('ten thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred sixty eight' AND ('six thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred sixty' AND ('fourteen thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred forty eight' AND ('one thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred forty' AND ('nine thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred forty four' AND ('five thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred thirty six' AND ('thirteen thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred ninety six' AND ('three thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred eighty eight' AND ('eleven thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred ninety two' AND ('seven thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred eighty four' AND ('fifteen thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred sixty eight' AND ('three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred sixty' AND ('eight thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred sixty four' AND ('four thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred fifty six' AND ('twelve thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred sixteen' AND ('two thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred eight' AND ('ten thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred twelve' AND ('six thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred four' AND ('fourteen thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred ninety two' AND ('one thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred eighty four' AND ('nine thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred eighty eight' AND ('five thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred eighty' AND ('thirteen thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred forty' AND ('three thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred thirty two' AND ('eleven thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred thirty six' AND ('seven thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred twenty eight' AND ('fifteen thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred eighty' AND ('eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seventy two' AND ('nine thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred seventy six' AND ('four thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred sixty eight' AND ('thirteen thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred twenty eight' AND ('two thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred twenty' AND ('eleven thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand twenty four' AND ('seven thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred sixteen' AND ('fifteen thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred four' AND ('one thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand ninety six' AND ('ten thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand' AND ('six thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred ninety two' AND ('fourteen thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred fifty two' AND ('three thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred forty four' AND ('twelve thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand forty eight' AND ('eight thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred forty' AND ('sixteen thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred forty' AND ('two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred thirty two' AND ('eight thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred thirty six' AND ('four thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred twenty eight' AND ('twelve thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred eighty eight' AND ('two thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred eighty' AND ('ten thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred eighty four' AND ('six thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred seventy six' AND ('fourteen thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred sixty four' AND ('one thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred fifty six' AND ('nine thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred sixty' AND ('five thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred fifty two' AND ('thirteen thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred twelve' AND ('three thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred four' AND ('eleven thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred eight' AND ('seven thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred' AND ('fifteen thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred fifty two' AND ('seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred forty four' AND ('eight thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred forty eight' AND ('four thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand forty' AND ('thirteen thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred' AND ('two thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred ninety two' AND ('ten thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred ninety six' AND ('six thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eighty eight' AND ('fifteen thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred seventy six' AND ('one thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred sixty eight' AND ('nine thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred seventy two' AND ('five thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand sixty four' AND ('fourteen thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred twenty four' AND ('three thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand sixteen' AND ('twelve thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred twenty' AND ('seven thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred twelve' AND ('sixteen thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred ninety six' AND ('four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred eighty eight' AND ('eight thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred ninety two' AND ('four thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred eighty four' AND ('twelve thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred forty four' AND ('two thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred thirty six' AND ('ten thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred forty' AND ('six thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred thirty two' AND ('fourteen thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred twenty' AND ('one thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred twelve' AND ('nine thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred sixteen' AND ('five thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred eight' AND ('thirteen thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred sixty eight' AND ('three thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred sixty' AND ('eleven thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred sixty four' AND ('seven thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred fifty six' AND ('fifteen thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight' AND ('one thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred' AND ('nine thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred four' AND ('five thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred ninety six' AND ('thirteen thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand fifty six' AND ('three thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred forty eight' AND ('eleven thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred fifty two' AND ('seven thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred forty four' AND ('fifteen thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand thirty two' AND ('two thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred twenty four' AND ('ten thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred twenty eight' AND ('six thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred twenty' AND ('fourteen thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eighty' AND ('four thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred seventy two' AND ('twelve thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred seventy six' AND ('eight thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred sixty eight' AND ('sixteen thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight' AND ('eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred' AND ('eight thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred four' AND ('four thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred ninety six' AND ('twelve thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand fifty six' AND ('two thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred forty eight' AND ('ten thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred fifty two' AND ('six thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred forty four' AND ('fourteen thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand thirty two' AND ('one thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred twenty four' AND ('nine thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred twenty eight' AND ('five thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred twenty' AND ('thirteen thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eighty' AND ('three thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred seventy two' AND ('eleven thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred seventy six' AND ('seven thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred sixty eight' AND ('fifteen thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred twenty' AND ('five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred twelve' AND ('eight thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred sixteen' AND ('four thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred eight' AND ('twelve thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred sixty eight' AND ('two thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred sixty' AND ('ten thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred sixty four' AND ('six thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred fifty six' AND ('fourteen thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred forty four' AND ('one thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred thirty six' AND ('nine thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred forty' AND ('five thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred thirty two' AND ('thirteen thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred ninety two' AND ('three thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred eighty four' AND ('eleven thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred eighty eight' AND ('seven thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred eighty' AND ('fifteen thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred sixty four' AND ('two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred fifty six' AND ('eight thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred sixty' AND ('four thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred fifty two' AND ('twelve thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred twelve' AND ('two thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred four' AND ('ten thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred eight' AND ('six thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred' AND ('fourteen thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred eighty eight' AND ('one thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred eighty' AND ('nine thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred eighty four' AND ('five thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred seventy six' AND ('thirteen thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred thirty six' AND ('three thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred twenty eight' AND ('eleven thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred thirty two' AND ('seven thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred twenty four' AND ('fifteen thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred seventy six' AND ('seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred sixty eight' AND ('eight thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred seventy two' AND ('four thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand sixty four' AND ('thirteen thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred twenty four' AND ('two thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand sixteen' AND ('eleven thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred twenty' AND ('six thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred twelve' AND ('fifteen thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred' AND ('one thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred ninety two' AND ('nine thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred ninety six' AND ('five thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eighty eight' AND ('fourteen thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred forty eight' AND ('three thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand forty' AND ('twelve thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred forty four' AND ('seven thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred thirty six' AND ('sixteen thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred thirty six' AND ('one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred twenty eight' AND ('eight thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred thirty two' AND ('four thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred twenty four' AND ('twelve thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred eighty four' AND ('two thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred seventy six' AND ('ten thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred eighty' AND ('six thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred seventy two' AND ('fourteen thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred sixty' AND ('one thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred fifty two' AND ('nine thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred fifty six' AND ('five thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred forty eight' AND ('thirteen thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred eight' AND ('three thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred' AND ('eleven thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred four' AND ('seven thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred ninety six' AND ('fifteen thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred forty eight' AND ('six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred forty' AND ('eight thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred forty four' AND ('four thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred thirty six' AND ('twelve thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred ninety six' AND ('two thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred eighty eight' AND ('ten thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred ninety two' AND ('six thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred eighty four' AND ('fourteen thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred seventy two' AND ('one thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred sixty four' AND ('nine thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred sixty eight' AND ('five thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred sixty' AND ('thirteen thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred twenty' AND ('three thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred twelve' AND ('eleven thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred sixteen' AND ('seven thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand eight' AND ('sixteen thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred ninety two' AND ('three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred eighty four' AND ('eight thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred eighty eight' AND ('four thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred eighty' AND ('twelve thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred forty' AND ('two thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred thirty two' AND ('ten thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred thirty six' AND ('six thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred twenty eight' AND ('fourteen thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred sixteen' AND ('one thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred eight' AND ('nine thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred twelve' AND ('five thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred four' AND ('thirteen thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred sixty four' AND ('three thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred fifty six' AND ('eleven thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred sixty' AND ('seven thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred fifty two' AND ('fifteen thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred four' AND ('nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand ninety six' AND ('nine thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand' AND ('five thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred ninety two' AND ('thirteen thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred fifty two' AND ('two thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred forty four' AND ('eleven thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand forty eight' AND ('seven thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred forty' AND ('fifteen thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred twenty eight' AND ('one thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred twenty' AND ('ten thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand twenty four' AND ('six thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred sixteen' AND ('fourteen thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred seventy six' AND ('three thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred sixty eight' AND ('twelve thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seventy two' AND ('eight thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred sixty four' AND ('sixteen thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seventy two' AND ('seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred sixty four' AND ('eight thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred sixty eight' AND ('four thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred sixty' AND ('twelve thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred twenty' AND ('two thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred twelve' AND ('ten thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred sixteen' AND ('six thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred eight' AND ('fourteen thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand ninety six' AND ('one thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred eighty eight' AND ('nine thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred ninety two' AND ('five thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred eighty four' AND ('thirteen thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred forty four' AND ('three thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred thirty six' AND ('eleven thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred forty' AND ('seven thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred thirty two' AND ('fifteen thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred eighty four' AND ('five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred seventy six' AND ('eight thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred eighty' AND ('four thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred seventy two' AND ('twelve thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred thirty two' AND ('two thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred twenty four' AND ('ten thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred twenty eight' AND ('six thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred twenty' AND ('fourteen thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred eight' AND ('one thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred' AND ('nine thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred four' AND ('five thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred ninety six' AND ('thirteen thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred fifty six' AND ('three thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred forty eight' AND ('eleven thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred fifty two' AND ('seven thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred forty four' AND ('fifteen thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred twenty eight' AND ('three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred twenty' AND ('eight thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred twenty four' AND ('four thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred sixteen' AND ('twelve thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred seventy six' AND ('two thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred sixty eight' AND ('ten thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred seventy two' AND ('six thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred sixty four' AND ('fourteen thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred fifty two' AND ('one thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred forty four' AND ('nine thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred forty eight' AND ('five thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred forty' AND ('thirteen thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred' AND ('three thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred ninety two' AND ('eleven thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred ninety six' AND ('seven thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred eighty eight' AND ('fifteen thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred forty' AND ('eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand thirty two' AND ('nine thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred thirty six' AND ('four thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred twenty eight' AND ('thirteen thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred eighty eight' AND ('two thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eighty' AND ('eleven thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred eighty four' AND ('six thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred seventy six' AND ('fifteen thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred sixty four' AND ('one thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand fifty six' AND ('ten thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred sixty' AND ('five thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred fifty two' AND ('fourteen thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred twelve' AND ('three thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred four' AND ('twelve thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight' AND ('eight thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred' AND ('sixteen thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred' AND ('two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred ninety two' AND ('eight thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred ninety six' AND ('four thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred eighty eight' AND ('twelve thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred forty eight' AND ('two thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred forty' AND ('ten thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred forty four' AND ('six thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred thirty six' AND ('fourteen thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred twenty four' AND ('one thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred sixteen' AND ('nine thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred twenty' AND ('five thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred twelve' AND ('thirteen thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred seventy two' AND ('three thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred sixty four' AND ('eleven thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred sixty eight' AND ('seven thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred sixty' AND ('fifteen thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred twelve' AND ('seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred four' AND ('eight thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred eight' AND ('four thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand' AND ('thirteen thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred sixty' AND ('two thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred fifty two' AND ('ten thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred fifty six' AND ('six thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand forty eight' AND ('fifteen thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred thirty six' AND ('one thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred twenty eight' AND ('nine thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred thirty two' AND ('five thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand twenty four' AND ('fourteen thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred eighty four' AND ('three thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred seventy six' AND ('eleven thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred eighty' AND ('seven thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand seventy two' AND ('sixteen thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred fifty six' AND ('four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred forty eight' AND ('eight thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred fifty two' AND ('four thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred forty four' AND ('twelve thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred four' AND ('two thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred ninety six' AND ('ten thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred' AND ('six thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred ninety two' AND ('fourteen thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred eighty' AND ('one thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred seventy two' AND ('nine thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred seventy six' AND ('five thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred sixty eight' AND ('thirteen thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred twenty eight' AND ('three thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred twenty' AND ('eleven thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred twenty four' AND ('seven thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred sixteen' AND ('fifteen thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred sixty eight' AND ('nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred sixty' AND ('nine thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand sixty four' AND ('five thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred fifty six' AND ('thirteen thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand sixteen' AND ('three thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred eight' AND ('eleven thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred twelve' AND ('seven thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred four' AND ('fifteen thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred ninety two' AND ('one thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred eighty four' AND ('ten thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eighty eight' AND ('six thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred eighty' AND ('fourteen thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand forty' AND ('four thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred thirty two' AND ('twelve thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred thirty six' AND ('eight thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred twenty eight' AND ('sixteen thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'forty' AND ('forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred thirty two' AND ('eight thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred thirty six' AND ('four thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred twenty eight' AND ('twelve thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eighty eight' AND ('two thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred eighty' AND ('ten thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred eighty four' AND ('six thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred seventy six' AND ('fourteen thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand sixty four' AND ('one thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred fifty six' AND ('nine thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred sixty' AND ('five thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred fifty two' AND ('thirteen thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred twelve' AND ('three thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred four' AND ('eleven thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred eight' AND ('seven thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred' AND ('fifteen thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred fifty two' AND ('five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred forty four' AND ('eight thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred forty eight' AND ('four thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred forty' AND ('twelve thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred' AND ('two thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred ninety two' AND ('ten thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred ninety six' AND ('six thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred eighty eight' AND ('fourteen thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred seventy six' AND ('one thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred sixty eight' AND ('nine thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred seventy two' AND ('five thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred sixty four' AND ('thirteen thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred twenty four' AND ('three thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred sixteen' AND ('eleven thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred twenty' AND ('seven thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred twelve' AND ('fifteen thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred ninety six' AND ('two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred eighty eight' AND ('eight thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred ninety two' AND ('four thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred eighty four' AND ('twelve thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred forty four' AND ('two thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred thirty six' AND ('ten thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred forty' AND ('six thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred thirty two' AND ('fourteen thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred twenty' AND ('one thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred twelve' AND ('nine thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred sixteen' AND ('five thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred eight' AND ('thirteen thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred sixty eight' AND ('three thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred sixty' AND ('eleven thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred sixty four' AND ('seven thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred fifty six' AND ('fifteen thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred eight' AND ('eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand' AND ('nine thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred four' AND ('four thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand ninety six' AND ('thirteen thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred fifty six' AND ('two thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand forty eight' AND ('eleven thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred fifty two' AND ('six thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred forty four' AND ('fifteen thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred thirty two' AND ('one thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand twenty four' AND ('ten thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred twenty eight' AND ('five thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred twenty' AND ('fourteen thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred eighty' AND ('three thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seventy two' AND ('twelve thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred seventy six' AND ('seven thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred sixty eight' AND ('sixteen thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred sixty eight' AND ('one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred sixty' AND ('eight thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred sixty four' AND ('four thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred fifty six' AND ('twelve thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred sixteen' AND ('two thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred eight' AND ('ten thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred twelve' AND ('six thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred four' AND ('fourteen thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred ninety two' AND ('one thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred eighty four' AND ('nine thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred eighty eight' AND ('five thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred eighty' AND ('thirteen thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred forty' AND ('three thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred thirty two' AND ('eleven thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred thirty six' AND ('seven thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred twenty eight' AND ('fifteen thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred eighty' AND ('six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred seventy two' AND ('eight thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred seventy six' AND ('four thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred sixty eight' AND ('twelve thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred twenty eight' AND ('two thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred twenty' AND ('ten thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred twenty four' AND ('six thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand sixteen' AND ('fifteen thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred four' AND ('one thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred ninety six' AND ('nine thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred' AND ('five thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred ninety two' AND ('thirteen thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred fifty two' AND ('three thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred forty four' AND ('eleven thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred forty eight' AND ('seven thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand forty' AND ('sixteen thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred twenty four' AND ('four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred sixteen' AND ('eight thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred twenty' AND ('four thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred twelve' AND ('twelve thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred seventy two' AND ('two thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred sixty four' AND ('ten thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred sixty eight' AND ('six thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred sixty' AND ('fourteen thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred forty eight' AND ('one thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred forty' AND ('nine thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred forty four' AND ('five thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred thirty six' AND ('thirteen thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred ninety six' AND ('three thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred eighty eight' AND ('eleven thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred ninety two' AND ('seven thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred eighty four' AND ('fifteen thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred thirty six' AND ('nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred twenty eight' AND ('nine thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand thirty two' AND ('five thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred twenty four' AND ('thirteen thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred eighty four' AND ('two thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred seventy six' AND ('eleven thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eighty' AND ('seven thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred seventy two' AND ('fifteen thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred sixty' AND ('one thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred fifty two' AND ('ten thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand fifty six' AND ('six thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred forty eight' AND ('fourteen thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight' AND ('four thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred' AND ('twelve thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred four' AND ('eight thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred ninety six' AND ('sixteen thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred four' AND ('one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred ninety six' AND ('eight thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred' AND ('four thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred ninety two' AND ('twelve thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred fifty two' AND ('two thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred forty four' AND ('ten thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred forty eight' AND ('six thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred forty' AND ('fourteen thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred twenty eight' AND ('one thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred twenty' AND ('nine thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred twenty four' AND ('five thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred sixteen' AND ('thirteen thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred seventy six' AND ('three thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred sixty eight' AND ('eleven thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred seventy two' AND ('seven thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred sixty four' AND ('fifteen thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred sixteen' AND ('six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred eight' AND ('eight thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred twelve' AND ('four thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred four' AND ('twelve thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred sixty four' AND ('two thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred fifty six' AND ('ten thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred sixty' AND ('six thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred fifty two' AND ('fourteen thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred forty' AND ('one thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred thirty two' AND ('nine thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred thirty six' AND ('five thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred twenty eight' AND ('thirteen thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred eighty eight' AND ('three thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred eighty' AND ('eleven thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred eighty four' AND ('seven thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred seventy six' AND ('fifteen thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred sixty' AND ('three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred fifty two' AND ('eight thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred fifty six' AND ('four thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred forty eight' AND ('twelve thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred eight' AND ('two thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred' AND ('ten thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred four' AND ('six thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred ninety six' AND ('fourteen thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred eighty four' AND ('one thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred seventy six' AND ('nine thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred eighty' AND ('five thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred seventy two' AND ('thirteen thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred thirty two' AND ('three thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred twenty four' AND ('eleven thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred twenty eight' AND ('seven thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred twenty' AND ('fifteen thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred seventy two' AND ('eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand sixty four' AND ('nine thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred sixty eight' AND ('four thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred sixty' AND ('thirteen thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred twenty' AND ('two thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred twelve' AND ('eleven thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand sixteen' AND ('seven thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred eight' AND ('fifteen thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred ninety six' AND ('one thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eighty eight' AND ('ten thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred ninety two' AND ('five thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred eighty four' AND ('fourteen thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred forty four' AND ('three thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred thirty six' AND ('twelve thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand forty' AND ('eight thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred thirty two' AND ('sixteen thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred thirty two' AND ('two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred twenty four' AND ('eight thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred twenty eight' AND ('four thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred twenty' AND ('twelve thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred eighty' AND ('two thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred seventy two' AND ('ten thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred seventy six' AND ('six thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred sixty eight' AND ('fourteen thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred fifty six' AND ('one thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred forty eight' AND ('nine thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred fifty two' AND ('five thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred forty four' AND ('thirteen thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred four' AND ('three thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred ninety six' AND ('eleven thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred' AND ('seven thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred ninety two' AND ('fifteen thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred forty four' AND ('seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred thirty six' AND ('eight thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred forty' AND ('four thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand thirty two' AND ('thirteen thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred ninety two' AND ('two thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred eighty four' AND ('ten thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred eighty eight' AND ('six thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eighty' AND ('fifteen thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred sixty eight' AND ('one thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred sixty' AND ('nine thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred sixty four' AND ('five thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand fifty six' AND ('fourteen thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred sixteen' AND ('three thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight' AND ('twelve thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred twelve' AND ('seven thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred four' AND ('sixteen thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred eighty eight' AND ('four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred eighty' AND ('eight thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred eighty four' AND ('four thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred seventy six' AND ('twelve thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred thirty six' AND ('two thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred twenty eight' AND ('ten thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred thirty two' AND ('six thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred twenty four' AND ('fourteen thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred twelve' AND ('one thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred four' AND ('nine thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred eight' AND ('five thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred' AND ('thirteen thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred sixty' AND ('three thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred fifty two' AND ('eleven thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred fifty six' AND ('seven thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred forty eight' AND ('fifteen thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand' AND ('one thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred ninety two' AND ('nine thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand ninety six' AND ('five thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred eighty eight' AND ('thirteen thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand forty eight' AND ('three thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred forty' AND ('eleven thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred forty four' AND ('seven thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred thirty six' AND ('fifteen thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand twenty four' AND ('two thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred sixteen' AND ('ten thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred twenty' AND ('six thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred twelve' AND ('fourteen thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seventy two' AND ('four thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred sixty four' AND ('twelve thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred sixty eight' AND ('eight thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred sixty' AND ('sixteen thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twenty four' AND ('twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred sixteen' AND ('eight thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred twenty' AND ('four thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred twelve' AND ('twelve thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seventy two' AND ('two thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred sixty four' AND ('ten thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred sixty eight' AND ('six thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred sixty' AND ('fourteen thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand forty eight' AND ('one thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred forty' AND ('nine thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred forty four' AND ('five thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred thirty six' AND ('thirteen thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand ninety six' AND ('three thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred eighty eight' AND ('eleven thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred ninety two' AND ('seven thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred eighty four' AND ('fifteen thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred thirty six' AND ('five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred twenty eight' AND ('eight thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred thirty two' AND ('four thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred twenty four' AND ('twelve thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred eighty four' AND ('two thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred seventy six' AND ('ten thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred eighty' AND ('six thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred seventy two' AND ('fourteen thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred sixty' AND ('one thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred fifty two' AND ('nine thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred fifty six' AND ('five thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred forty eight' AND ('thirteen thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred eight' AND ('three thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred' AND ('eleven thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred four' AND ('seven thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred ninety six' AND ('fifteen thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred eighty' AND ('two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred seventy two' AND ('eight thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred seventy six' AND ('four thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred sixty eight' AND ('twelve thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred twenty eight' AND ('two thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred twenty' AND ('ten thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred twenty four' AND ('six thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred sixteen' AND ('fourteen thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred four' AND ('one thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred ninety six' AND ('nine thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred' AND ('five thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred ninety two' AND ('thirteen thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred fifty two' AND ('three thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred forty four' AND ('eleven thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred forty eight' AND ('seven thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred forty' AND ('fifteen thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred ninety two' AND ('seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred eighty four' AND ('eight thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred eighty eight' AND ('four thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eighty' AND ('thirteen thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred forty' AND ('two thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand thirty two' AND ('eleven thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred thirty six' AND ('six thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred twenty eight' AND ('fifteen thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred sixteen' AND ('one thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight' AND ('ten thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred twelve' AND ('five thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred four' AND ('fourteen thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred sixty four' AND ('three thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand fifty six' AND ('twelve thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred sixty' AND ('seven thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred fifty two' AND ('sixteen thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred fifty two' AND ('one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred forty four' AND ('eight thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred forty eight' AND ('four thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred forty' AND ('twelve thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred' AND ('two thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred ninety two' AND ('ten thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred ninety six' AND ('six thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred eighty eight' AND ('fourteen thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred seventy six' AND ('one thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred sixty eight' AND ('nine thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred seventy two' AND ('five thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred sixty four' AND ('thirteen thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred twenty four' AND ('three thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred sixteen' AND ('eleven thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred twenty' AND ('seven thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred twelve' AND ('fifteen thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred sixty four' AND ('six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred fifty six' AND ('eight thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred sixty' AND ('four thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred fifty two' AND ('twelve thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred twelve' AND ('two thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred four' AND ('ten thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred eight' AND ('six thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand' AND ('fifteen thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred eighty eight' AND ('one thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred eighty' AND ('nine thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred eighty four' AND ('five thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred seventy six' AND ('thirteen thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred thirty six' AND ('three thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred twenty eight' AND ('eleven thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred thirty two' AND ('seven thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand twenty four' AND ('sixteen thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred eight' AND ('four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred' AND ('eight thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred four' AND ('four thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred ninety six' AND ('twelve thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred fifty six' AND ('two thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred forty eight' AND ('ten thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred fifty two' AND ('six thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred forty four' AND ('fourteen thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred thirty two' AND ('one thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred twenty four' AND ('nine thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred twenty eight' AND ('five thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred twenty' AND ('thirteen thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred eighty' AND ('three thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred seventy two' AND ('eleven thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred seventy six' AND ('seven thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred sixty eight' AND ('fifteen thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred twenty' AND ('nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred twelve' AND ('nine thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand sixteen' AND ('five thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred eight' AND ('thirteen thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred sixty eight' AND ('two thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred sixty' AND ('eleven thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand sixty four' AND ('seven thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred fifty six' AND ('fifteen thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred forty four' AND ('one thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred thirty six' AND ('ten thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand forty' AND ('six thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred thirty two' AND ('fourteen thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred ninety two' AND ('three thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred eighty four' AND ('twelve thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eighty eight' AND ('eight thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred eighty' AND ('sixteen thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eighty eight' AND ('eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred eighty' AND ('eight thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred eighty four' AND ('four thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred seventy six' AND ('twelve thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred thirty six' AND ('two thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred twenty eight' AND ('ten thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred thirty two' AND ('six thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred twenty four' AND ('fourteen thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred twelve' AND ('one thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred four' AND ('nine thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred eight' AND ('five thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred' AND ('thirteen thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred sixty' AND ('three thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred fifty two' AND ('eleven thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred fifty six' AND ('seven thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred forty eight' AND ('fifteen thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred' AND ('six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred ninety two' AND ('eight thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred ninety six' AND ('four thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred eighty eight' AND ('twelve thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred forty eight' AND ('two thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred forty' AND ('ten thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred forty four' AND ('six thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred thirty six' AND ('fourteen thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred twenty four' AND ('one thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred sixteen' AND ('nine thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred twenty' AND ('five thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred twelve' AND ('thirteen thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred seventy two' AND ('three thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred sixty four' AND ('eleven thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred sixty eight' AND ('seven thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred sixty' AND ('fifteen thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred forty four' AND ('three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred thirty six' AND ('eight thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred forty' AND ('four thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred thirty two' AND ('twelve thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred ninety two' AND ('two thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred eighty four' AND ('ten thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred eighty eight' AND ('six thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred eighty' AND ('fourteen thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred sixty eight' AND ('one thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred sixty' AND ('nine thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred sixty four' AND ('five thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred fifty six' AND ('thirteen thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred sixteen' AND ('three thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred eight' AND ('eleven thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred twelve' AND ('seven thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred four' AND ('fifteen thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred fifty six' AND ('eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand forty eight' AND ('nine thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred fifty two' AND ('four thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred forty four' AND ('thirteen thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred four' AND ('two thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand ninety six' AND ('eleven thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand' AND ('seven thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred ninety two' AND ('fifteen thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred eighty' AND ('one thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seventy two' AND ('ten thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred seventy six' AND ('five thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred sixty eight' AND ('fourteen thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred twenty eight' AND ('three thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred twenty' AND ('twelve thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand twenty four' AND ('eight thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred sixteen' AND ('sixteen thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred sixteen' AND ('two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred eight' AND ('eight thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred twelve' AND ('four thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred four' AND ('twelve thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred sixty four' AND ('two thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred fifty six' AND ('ten thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred sixty' AND ('six thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred fifty two' AND ('fourteen thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred forty' AND ('one thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred thirty two' AND ('nine thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred thirty six' AND ('five thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred twenty eight' AND ('thirteen thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred eighty eight' AND ('three thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred eighty' AND ('eleven thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred eighty four' AND ('seven thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred seventy six' AND ('fifteen thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred twenty eight' AND ('seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred twenty' AND ('eight thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred twenty four' AND ('four thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand sixteen' AND ('thirteen thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred seventy six' AND ('two thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred sixty eight' AND ('ten thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred seventy two' AND ('six thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand sixty four' AND ('fifteen thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred fifty two' AND ('one thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred forty four' AND ('nine thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred forty eight' AND ('five thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand forty' AND ('fourteen thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred' AND ('three thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred ninety two' AND ('eleven thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred ninety six' AND ('seven thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand eighty eight' AND ('sixteen thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred seventy two' AND ('four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred sixty four' AND ('eight thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred sixty eight' AND ('four thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred sixty' AND ('twelve thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred twenty' AND ('two thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred twelve' AND ('ten thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred sixteen' AND ('six thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred eight' AND ('fourteen thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred ninety six' AND ('one thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred eighty eight' AND ('nine thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred ninety two' AND ('five thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred eighty four' AND ('thirteen thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred forty four' AND ('three thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred thirty six' AND ('eleven thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred forty' AND ('seven thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred thirty two' AND ('fifteen thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred eighty four' AND ('nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred seventy six' AND ('nine thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eighty' AND ('five thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred seventy two' AND ('thirteen thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand thirty two' AND ('three thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred twenty four' AND ('eleven thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred twenty eight' AND ('seven thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred twenty' AND ('fifteen thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight' AND ('two thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred' AND ('ten thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred four' AND ('six thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred ninety six' AND ('fourteen thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand fifty six' AND ('four thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred forty eight' AND ('twelve thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred fifty two' AND ('eight thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred forty four' AND ('sixteen thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifty six' AND ('fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred forty eight' AND ('eight thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred fifty two' AND ('four thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred forty four' AND ('twelve thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred four' AND ('two thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred ninety six' AND ('ten thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred' AND ('six thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred ninety two' AND ('fourteen thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eighty' AND ('one thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred seventy two' AND ('nine thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred seventy six' AND ('five thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred sixty eight' AND ('thirteen thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred twenty eight' AND ('three thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred twenty' AND ('eleven thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred twenty four' AND ('seven thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred sixteen' AND ('fifteen thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred sixty eight' AND ('five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred sixty' AND ('eight thousand seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred sixty four' AND ('four thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred fifty six' AND ('twelve thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred sixteen' AND ('two thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred eight' AND ('ten thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred twelve' AND ('six thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred four' AND ('fourteen thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred ninety two' AND ('one thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred eighty four' AND ('nine thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred eighty eight' AND ('five thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred eighty' AND ('thirteen thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred forty' AND ('three thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred thirty two' AND ('eleven thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred thirty six' AND ('seven thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred twenty eight' AND ('fifteen thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred twelve' AND ('three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred four' AND ('eight thousand five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred eight' AND ('four thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred' AND ('twelve thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred sixty' AND ('two thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred fifty two' AND ('ten thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred fifty six' AND ('six thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred forty eight' AND ('fourteen thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred thirty six' AND ('one thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred twenty eight' AND ('nine thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred thirty two' AND ('five thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred twenty four' AND ('thirteen thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred eighty four' AND ('three thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred seventy six' AND ('eleven thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred eighty' AND ('seven thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred seventy two' AND ('fifteen thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred twenty four' AND ('eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand sixteen' AND ('nine thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred twenty' AND ('four thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred twelve' AND ('thirteen thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred seventy two' AND ('two thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand sixty four' AND ('eleven thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred sixty eight' AND ('six thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred sixty' AND ('fifteen thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred forty eight' AND ('one thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand forty' AND ('ten thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred forty four' AND ('five thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred thirty six' AND ('fourteen thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred ninety six' AND ('three thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eighty eight' AND ('twelve thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred ninety two' AND ('seven thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred eighty four' AND ('sixteen thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred eighty four' AND ('one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred seventy six' AND ('eight thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred eighty' AND ('four thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred seventy two' AND ('twelve thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred thirty two' AND ('two thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred twenty four' AND ('ten thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred twenty eight' AND ('six thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred twenty' AND ('fourteen thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred eight' AND ('one thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred' AND ('nine thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred four' AND ('five thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred ninety six' AND ('thirteen thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred fifty six' AND ('three thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred forty eight' AND ('eleven thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred fifty two' AND ('seven thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred forty four' AND ('fifteen thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred ninety six' AND ('six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred eighty eight' AND ('eight thousand eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred ninety two' AND ('four thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred eighty four' AND ('twelve thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred forty four' AND ('two thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred thirty six' AND ('ten thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred forty' AND ('six thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand thirty two' AND ('fifteen thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred twenty' AND ('one thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred twelve' AND ('nine thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred sixteen' AND ('five thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight' AND ('fourteen thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred sixty eight' AND ('three thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred sixty' AND ('eleven thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred sixty four' AND ('seven thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand fifty six' AND ('sixteen thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred forty' AND ('four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred thirty two' AND ('eight thousand six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred thirty six' AND ('four thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred twenty eight' AND ('twelve thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred eighty eight' AND ('two thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred eighty' AND ('ten thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred eighty four' AND ('six thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred seventy six' AND ('fourteen thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred sixty four' AND ('one thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred fifty six' AND ('nine thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred sixty' AND ('five thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred fifty two' AND ('thirteen thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred twelve' AND ('three thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred four' AND ('eleven thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred eight' AND ('seven thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred' AND ('fifteen thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred fifty two' AND ('nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred forty four' AND ('nine thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand forty eight' AND ('five thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred forty' AND ('thirteen thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand' AND ('three thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred ninety two' AND ('eleven thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand ninety six' AND ('seven thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred eighty eight' AND ('fifteen thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred seventy six' AND ('one thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred sixty eight' AND ('ten thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seventy two' AND ('six thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred sixty four' AND ('fourteen thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand twenty four' AND ('four thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred sixteen' AND ('twelve thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred twenty' AND ('eight thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred twelve' AND ('sixteen thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred twenty' AND ('one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred twelve' AND ('eight thousand three hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred sixteen' AND ('four thousand two hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred eight' AND ('twelve thousand four hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred sixty eight' AND ('two thousand one hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred sixty' AND ('ten thousand three hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred sixty four' AND ('six thousand two hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred fifty six' AND ('fourteen thousand four hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred forty four' AND ('one thousand one hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred thirty six' AND ('nine thousand three hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred forty' AND ('five thousand two hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred thirty two' AND ('thirteen thousand four hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred ninety two' AND ('three thousand one hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred eighty four' AND ('eleven thousand three hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred eighty eight' AND ('seven thousand two hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred eighty' AND ('fifteen thousand four hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred thirty two' AND ('six hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred twenty four' AND ('eight thousand eight hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred twenty eight' AND ('four thousand seven hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred twenty' AND ('twelve thousand nine hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred eighty' AND ('two thousand six hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred seventy two' AND ('ten thousand eight hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred seventy six' AND ('six thousand seven hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred sixty eight' AND ('fourteen thousand nine hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred fifty six' AND ('one thousand six hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred forty eight' AND ('nine thousand eight hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred fifty two' AND ('five thousand seven hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred forty four' AND ('thirteen thousand nine hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred four' AND ('three thousand seven hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred ninety six' AND ('eleven thousand eight hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred' AND ('seven thousand eight hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred ninety two' AND ('fifteen thousand nine hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred seventy six' AND ('three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred sixty eight' AND ('eight thousand five hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred seventy two' AND ('four thousand four hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred sixty four' AND ('twelve thousand six hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred twenty four' AND ('two thousand four hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred sixteen' AND ('ten thousand six hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred twenty' AND ('six thousand five hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred twelve' AND ('fourteen thousand seven hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred' AND ('one thousand four hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred ninety two' AND ('nine thousand five hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred ninety six' AND ('five thousand four hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred eighty eight' AND ('thirteen thousand six hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred forty eight' AND ('three thousand four hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred forty' AND ('eleven thousand six hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred forty four' AND ('seven thousand five hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred thirty six' AND ('fifteen thousand seven hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred eighty eight' AND ('eight hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eighty' AND ('nine thousand eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred eighty four' AND ('four thousand nine hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred seventy six' AND ('thirteen thousand one hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred thirty six' AND ('two thousand nine hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred twenty eight' AND ('eleven thousand one hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand thirty two' AND ('seven thousand thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred twenty four' AND ('fifteen thousand two hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred twelve' AND ('one thousand nine hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred four' AND ('ten thousand one hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight' AND ('six thousand eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred' AND ('fourteen thousand two hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred sixty' AND ('three thousand nine hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred fifty two' AND ('twelve thousand one hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand fifty six' AND ('eight thousand fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred forty eight' AND ('sixteen thousand two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred forty eight' AND ('two hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred forty' AND ('eight thousand four hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred forty four' AND ('four thousand three hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred thirty six' AND ('twelve thousand five hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred ninety six' AND ('two thousand two hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred eighty eight' AND ('ten thousand four hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred ninety two' AND ('six thousand three hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred eighty four' AND ('fourteen thousand five hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred seventy two' AND ('one thousand two hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred sixty four' AND ('nine thousand four hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred sixty eight' AND ('five thousand three hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred sixty' AND ('thirteen thousand five hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred twenty' AND ('three thousand three hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred twelve' AND ('eleven thousand five hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred sixteen' AND ('seven thousand four hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred eight' AND ('fifteen thousand six hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred sixty' AND ('seven hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred fifty two' AND ('eight thousand nine hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred fifty six' AND ('four thousand eight hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand forty eight' AND ('thirteen thousand forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred eight' AND ('two thousand eight hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand' AND ('eleven thousand'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred four' AND ('six thousand nine hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand ninety six' AND ('fifteen thousand ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred eighty four' AND ('one thousand seven hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred seventy six' AND ('nine thousand nine hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred eighty' AND ('five thousand eight hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seventy two' AND ('fourteen thousand seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred thirty two' AND ('three thousand eight hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand twenty four' AND ('twelve thousand twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred twenty eight' AND ('seven thousand nine hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred twenty' AND ('sixteen thousand one hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred four' AND ('five hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred ninety six' AND ('eight thousand six hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred' AND ('four thousand six hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred ninety two' AND ('twelve thousand seven hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred fifty two' AND ('two thousand five hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred forty four' AND ('ten thousand seven hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred forty eight' AND ('six thousand six hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred forty' AND ('fourteen thousand eight hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred twenty eight' AND ('one thousand five hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred twenty' AND ('nine thousand seven hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred twenty four' AND ('five thousand six hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred sixteen' AND ('thirteen thousand eight hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred seventy six' AND ('three thousand five hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred sixty eight' AND ('eleven thousand seven hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred seventy two' AND ('seven thousand six hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred sixty four' AND ('fifteen thousand eight hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand sixteen' AND ('one thousand sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred eight' AND ('nine thousand two hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred twelve' AND ('five thousand one hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred four' AND ('thirteen thousand three hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand sixty four' AND ('three thousand sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred fifty six' AND ('eleven thousand two hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred sixty' AND ('seven thousand one hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred fifty two' AND ('fifteen thousand three hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand forty' AND ('two thousand forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred thirty two' AND ('ten thousand two hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred thirty six' AND ('six thousand one hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred twenty eight' AND ('fourteen thousand three hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eighty eight' AND ('four thousand eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred eighty' AND ('twelve thousand two hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred eighty four' AND ('eight thousand one hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred seventy six' AND ('sixteen thousand three hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four' AND ('four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred ninety six' AND ('eight thousand one hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred' AND ('four thousand one hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred ninety two' AND ('twelve thousand two hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand fifty two' AND ('two thousand fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred forty four' AND ('ten thousand two hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred forty eight' AND ('six thousand one hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred forty' AND ('fourteen thousand three hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand twenty eight' AND ('one thousand twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred twenty' AND ('nine thousand two hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred twenty four' AND ('five thousand one hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred sixteen' AND ('thirteen thousand three hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seventy six' AND ('three thousand seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred sixty eight' AND ('eleven thousand two hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred seventy two' AND ('seven thousand one hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred sixty four' AND ('fifteen thousand three hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred sixteen' AND ('five hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred eight' AND ('eight thousand seven hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred twelve' AND ('four thousand six hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred four' AND ('twelve thousand eight hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred sixty four' AND ('two thousand five hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred fifty six' AND ('ten thousand seven hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred sixty' AND ('six thousand six hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred fifty two' AND ('fourteen thousand eight hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred forty' AND ('one thousand five hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred thirty two' AND ('nine thousand seven hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred thirty six' AND ('five thousand six hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred twenty eight' AND ('thirteen thousand eight hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred eighty eight' AND ('three thousand five hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred eighty' AND ('eleven thousand seven hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred eighty four' AND ('seven thousand six hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred seventy six' AND ('fifteen thousand eight hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred sixty' AND ('two hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred fifty two' AND ('eight thousand four hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred fifty six' AND ('four thousand three hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred forty eight' AND ('twelve thousand five hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred eight' AND ('two thousand three hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred' AND ('ten thousand five hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred four' AND ('six thousand four hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred ninety six' AND ('fourteen thousand five hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred eighty four' AND ('one thousand two hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred seventy six' AND ('nine thousand four hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred eighty' AND ('five thousand three hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred seventy two' AND ('thirteen thousand five hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred thirty two' AND ('three thousand three hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred twenty four' AND ('eleven thousand five hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred twenty eight' AND ('seven thousand four hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred twenty' AND ('fifteen thousand six hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred seventy two' AND ('seven hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred sixty four' AND ('eight thousand nine hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred sixty eight' AND ('four thousand eight hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand sixty' AND ('thirteen thousand sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred twenty' AND ('two thousand eight hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand twelve' AND ('eleven thousand twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred sixteen' AND ('six thousand nine hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred eight' AND ('fifteen thousand one hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred ninety six' AND ('one thousand seven hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred eighty eight' AND ('nine thousand nine hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred ninety two' AND ('five thousand eight hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eighty four' AND ('fourteen thousand eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred forty four' AND ('three thousand eight hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand thirty six' AND ('twelve thousand thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred forty' AND ('seven thousand nine hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred thirty two' AND ('sixteen thousand one hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred thirty two' AND ('one hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred twenty four' AND ('eight thousand three hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred twenty eight' AND ('four thousand two hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred twenty' AND ('twelve thousand four hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred eighty' AND ('two thousand one hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred seventy two' AND ('ten thousand three hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred seventy six' AND ('six thousand two hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred sixty eight' AND ('fourteen thousand four hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred fifty six' AND ('one thousand one hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred forty eight' AND ('nine thousand three hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred fifty two' AND ('five thousand two hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred forty four' AND ('thirteen thousand four hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred four' AND ('three thousand two hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred ninety six' AND ('eleven thousand three hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred' AND ('seven thousand three hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred ninety two' AND ('fifteen thousand four hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred forty four' AND ('six hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred thirty six' AND ('eight thousand eight hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred forty' AND ('four thousand seven hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred thirty two' AND ('twelve thousand nine hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred ninety two' AND ('two thousand six hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred eighty four' AND ('ten thousand eight hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred eighty eight' AND ('six thousand seven hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred eighty' AND ('fourteen thousand nine hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred sixty eight' AND ('one thousand six hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred sixty' AND ('nine thousand eight hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred sixty four' AND ('five thousand seven hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred fifty six' AND ('thirteen thousand nine hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred sixteen' AND ('three thousand seven hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred eight' AND ('eleven thousand nine hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred twelve' AND ('seven thousand eight hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand four' AND ('sixteen thousand four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred eighty eight' AND ('three hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred eighty' AND ('eight thousand five hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred eighty four' AND ('four thousand four hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred seventy six' AND ('twelve thousand six hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred thirty six' AND ('two thousand four hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred twenty eight' AND ('ten thousand six hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred thirty two' AND ('six thousand five hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred twenty four' AND ('fourteen thousand seven hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred twelve' AND ('one thousand four hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred four' AND ('nine thousand six hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred eight' AND ('five thousand five hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred' AND ('thirteen thousand seven hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred sixty' AND ('three thousand four hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred fifty two' AND ('eleven thousand six hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred fifty six' AND ('seven thousand five hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred forty eight' AND ('fifteen thousand seven hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred' AND ('nine hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand ninety two' AND ('nine thousand ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred ninety six' AND ('four thousand nine hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred eighty eight' AND ('thirteen thousand one hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred forty eight' AND ('two thousand nine hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred forty' AND ('eleven thousand one hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand forty four' AND ('seven thousand forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred thirty six' AND ('fifteen thousand two hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred twenty four' AND ('one thousand nine hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred sixteen' AND ('ten thousand one hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand twenty' AND ('six thousand twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred twelve' AND ('fourteen thousand two hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred seventy two' AND ('three thousand nine hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred sixty four' AND ('twelve thousand one hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand sixty eight' AND ('eight thousand sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred sixty' AND ('sixteen thousand two hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixty eight' AND ('sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred sixty' AND ('eight thousand two hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred sixty four' AND ('four thousand one hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred fifty six' AND ('twelve thousand three hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred sixteen' AND ('two thousand one hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred eight' AND ('ten thousand three hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred twelve' AND ('six thousand two hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred four' AND ('fourteen thousand four hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand ninety two' AND ('one thousand ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred eighty four' AND ('nine thousand two hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred eighty eight' AND ('five thousand one hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred eighty' AND ('thirteen thousand three hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred forty' AND ('three thousand one hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred thirty two' AND ('eleven thousand three hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred thirty six' AND ('seven thousand two hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred twenty eight' AND ('fifteen thousand four hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred eighty' AND ('five hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred seventy two' AND ('eight thousand seven hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred seventy six' AND ('four thousand six hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred sixty eight' AND ('twelve thousand eight hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred twenty eight' AND ('two thousand six hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred twenty' AND ('ten thousand eight hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred twenty four' AND ('six thousand seven hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred sixteen' AND ('fourteen thousand nine hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred four' AND ('one thousand six hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred ninety six' AND ('nine thousand seven hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred' AND ('five thousand seven hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred ninety two' AND ('thirteen thousand eight hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred fifty two' AND ('three thousand six hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred forty four' AND ('eleven thousand eight hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred forty eight' AND ('seven thousand seven hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred forty' AND ('fifteen thousand nine hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred twenty four' AND ('three hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred sixteen' AND ('eight thousand five hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred twenty' AND ('four thousand four hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred twelve' AND ('twelve thousand six hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred seventy two' AND ('two thousand three hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred sixty four' AND ('ten thousand five hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred sixty eight' AND ('six thousand four hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred sixty' AND ('fourteen thousand six hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred forty eight' AND ('one thousand three hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred forty' AND ('nine thousand five hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred forty four' AND ('five thousand four hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred thirty six' AND ('thirteen thousand six hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred ninety six' AND ('three thousand three hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred eighty eight' AND ('eleven thousand five hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred ninety two' AND ('seven thousand four hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred eighty four' AND ('fifteen thousand six hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred thirty six' AND ('eight hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand twenty eight' AND ('nine thousand twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred thirty two' AND ('four thousand nine hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred twenty four' AND ('thirteen thousand one hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred eighty four' AND ('two thousand eight hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seventy six' AND ('eleven thousand seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred eighty' AND ('six thousand nine hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred seventy two' AND ('fifteen thousand one hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred sixty' AND ('one thousand eight hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand fifty two' AND ('ten thousand fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred fifty six' AND ('five thousand nine hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred forty eight' AND ('fourteen thousand one hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred eight' AND ('three thousand nine hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred' AND ('twelve thousand one hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four' AND ('eight thousand four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred ninety six' AND ('sixteen thousand one hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred ninety six' AND ('one hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred eighty eight' AND ('eight thousand three hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred ninety two' AND ('four thousand two hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred eighty four' AND ('twelve thousand four hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred forty four' AND ('two thousand two hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred thirty six' AND ('ten thousand four hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred forty' AND ('six thousand three hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred thirty two' AND ('fourteen thousand five hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand two hundred twenty' AND ('one thousand two hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand four hundred twelve' AND ('nine thousand four hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand three hundred sixteen' AND ('five thousand three hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand five hundred eight' AND ('thirteen thousand five hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred sixty eight' AND ('three thousand two hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred sixty' AND ('eleven thousand four hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred sixty four' AND ('seven thousand three hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred fifty six' AND ('fifteen thousand five hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven hundred eight' AND ('seven hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred' AND ('eight thousand nine hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand eight hundred four' AND ('four thousand eight hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred ninety six' AND ('twelve thousand nine hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred fifty six' AND ('two thousand seven hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred forty eight' AND ('ten thousand nine hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred fifty two' AND ('six thousand eight hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand forty four' AND ('fifteen thousand forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred thirty two' AND ('one thousand seven hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand nine hundred twenty four' AND ('nine thousand nine hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand eight hundred twenty eight' AND ('five thousand eight hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand twenty' AND ('fourteen thousand twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred eighty' AND ('three thousand seven hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred seventy two' AND ('eleven thousand nine hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred seventy six' AND ('seven thousand eight hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand sixty eight' AND ('sixteen thousand sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred fifty two' AND ('four hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred forty four' AND ('eight thousand six hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred forty eight' AND ('four thousand five hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred forty' AND ('twelve thousand seven hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred' AND ('two thousand five hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred ninety two' AND ('ten thousand six hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred ninety six' AND ('six thousand five hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred eighty eight' AND ('fourteen thousand seven hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred seventy six' AND ('one thousand four hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred sixty eight' AND ('nine thousand six hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred seventy two' AND ('five thousand five hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred sixty four' AND ('thirteen thousand seven hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand five hundred twenty four' AND ('three thousand five hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand seven hundred sixteen' AND ('eleven thousand seven hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand six hundred twenty' AND ('seven thousand six hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand eight hundred twelve' AND ('fifteen thousand eight hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred sixty four' AND ('nine hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred fifty six' AND ('nine thousand one hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand sixty' AND ('five thousand sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred fifty two' AND ('thirteen thousand two hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand twelve' AND ('three thousand twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand two hundred four' AND ('eleven thousand two hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand one hundred eight' AND ('seven thousand one hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred' AND ('fifteen thousand three hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred eighty eight' AND ('one thousand nine hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred eighty' AND ('ten thousand one hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eighty four' AND ('six thousand eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred seventy six' AND ('fourteen thousand two hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand thirty six' AND ('four thousand thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand two hundred twenty eight' AND ('twelve thousand two hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred thirty two' AND ('eight thousand one hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand three hundred twenty four' AND ('sixteen thousand three hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirty six' AND ('thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred twenty eight' AND ('eight thousand two hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred thirty two' AND ('four thousand one hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred twenty four' AND ('twelve thousand three hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eighty four' AND ('two thousand eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand two hundred seventy six' AND ('ten thousand two hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand one hundred eighty' AND ('six thousand one hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand three hundred seventy two' AND ('fourteen thousand three hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand sixty' AND ('one thousand sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand two hundred fifty two' AND ('nine thousand two hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand one hundred fifty six' AND ('five thousand one hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand three hundred forty eight' AND ('thirteen thousand three hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred eight' AND ('three thousand one hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred' AND ('eleven thousand three hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred four' AND ('seven thousand two hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand three hundred ninety six' AND ('fifteen thousand three hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five hundred forty eight' AND ('five hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand seven hundred forty' AND ('eight thousand seven hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand six hundred forty four' AND ('four thousand six hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand eight hundred thirty six' AND ('twelve thousand eight hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand five hundred ninety six' AND ('two thousand five hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand seven hundred eighty eight' AND ('ten thousand seven hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand six hundred ninety two' AND ('six thousand six hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand eight hundred eighty four' AND ('fourteen thousand eight hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand five hundred seventy two' AND ('one thousand five hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand seven hundred sixty four' AND ('nine thousand seven hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand six hundred sixty eight' AND ('five thousand six hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand eight hundred sixty' AND ('thirteen thousand eight hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred twenty' AND ('three thousand six hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred twelve' AND ('eleven thousand eight hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred sixteen' AND ('seven thousand seven hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred eight' AND ('fifteen thousand nine hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred ninety two' AND ('two hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred eighty four' AND ('eight thousand four hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred eighty eight' AND ('four thousand three hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred eighty' AND ('twelve thousand five hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand three hundred forty' AND ('two thousand three hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred thirty two' AND ('ten thousand five hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand four hundred thirty six' AND ('six thousand four hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred twenty eight' AND ('fourteen thousand six hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred sixteen' AND ('one thousand three hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred eight' AND ('nine thousand five hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred twelve' AND ('five thousand four hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred four' AND ('thirteen thousand six hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand three hundred sixty four' AND ('three thousand three hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand five hundred fifty six' AND ('eleven thousand five hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand four hundred sixty' AND ('seven thousand four hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand six hundred fifty two' AND ('fifteen thousand six hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred four' AND ('eight hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand nine hundred ninety six' AND ('eight thousand nine hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred' AND ('four thousand nine hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand ninety two' AND ('thirteen thousand ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand eight hundred fifty two' AND ('two thousand eight hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand forty four' AND ('eleven thousand forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand nine hundred forty eight' AND ('six thousand nine hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand one hundred forty' AND ('fifteen thousand one hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred twenty eight' AND ('one thousand eight hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand twenty' AND ('ten thousand twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred twenty four' AND ('five thousand nine hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred sixteen' AND ('fourteen thousand one hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand eight hundred seventy six' AND ('three thousand eight hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand sixty eight' AND ('twelve thousand sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand nine hundred seventy two' AND ('seven thousand nine hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand one hundred sixty four' AND ('sixteen thousand one hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred sixty four' AND ('one hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand three hundred fifty six' AND ('eight thousand three hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand two hundred sixty' AND ('four thousand two hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand four hundred fifty two' AND ('twelve thousand four hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred twelve' AND ('two thousand two hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand four hundred four' AND ('ten thousand four hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand three hundred eight' AND ('six thousand three hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand five hundred' AND ('fourteen thousand five hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred eighty eight' AND ('one thousand one hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred eighty' AND ('nine thousand three hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred eighty four' AND ('five thousand two hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred seventy six' AND ('thirteen thousand four hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand two hundred thirty six' AND ('three thousand two hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand four hundred twenty eight' AND ('eleven thousand four hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand three hundred thirty two' AND ('seven thousand three hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand five hundred twenty four' AND ('fifteen thousand five hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred seventy six' AND ('six hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred sixty eight' AND ('eight thousand eight hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred seventy two' AND ('four thousand seven hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred sixty four' AND ('twelve thousand nine hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand seven hundred twenty four' AND ('two thousand seven hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand nine hundred sixteen' AND ('ten thousand nine hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand eight hundred twenty' AND ('six thousand eight hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand twelve' AND ('fifteen thousand twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand seven hundred' AND ('one thousand seven hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred ninety two' AND ('nine thousand eight hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred ninety six' AND ('five thousand seven hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred eighty eight' AND ('thirteen thousand nine hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand seven hundred forty eight' AND ('three thousand seven hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand nine hundred forty' AND ('eleven thousand nine hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand eight hundred forty four' AND ('seven thousand eight hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand thirty six' AND ('sixteen thousand thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four hundred twenty' AND ('four hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand six hundred twelve' AND ('eight thousand six hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand five hundred sixteen' AND ('four thousand five hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand seven hundred eight' AND ('twelve thousand seven hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred sixty eight' AND ('two thousand four hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand six hundred sixty' AND ('ten thousand six hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred sixty four' AND ('six thousand five hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand seven hundred fifty six' AND ('fourteen thousand seven hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand four hundred forty four' AND ('one thousand four hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand six hundred thirty six' AND ('nine thousand six hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand five hundred forty' AND ('five thousand five hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand seven hundred thirty two' AND ('thirteen thousand seven hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred ninety two' AND ('three thousand four hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred eighty four' AND ('eleven thousand six hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred eighty eight' AND ('seven thousand five hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred eighty' AND ('fifteen thousand seven hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine hundred thirty two' AND ('nine hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand one hundred twenty four' AND ('nine thousand one hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand twenty eight' AND ('five thousand twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand two hundred twenty' AND ('thirteen thousand two hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred eighty' AND ('two thousand nine hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred seventy two' AND ('eleven thousand one hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seventy six' AND ('seven thousand seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred sixty eight' AND ('fifteen thousand two hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand nine hundred fifty six' AND ('one thousand nine hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand one hundred forty eight' AND ('ten thousand one hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand fifty two' AND ('six thousand fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand two hundred forty four' AND ('fourteen thousand two hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four' AND ('four thousand four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred ninety six' AND ('twelve thousand one hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand one hundred' AND ('eight thousand one hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred ninety two' AND ('sixteen thousand two hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one hundred' AND ('one hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand two hundred ninety two' AND ('eight thousand two hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand one hundred ninety six' AND ('four thousand one hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand three hundred eighty eight' AND ('twelve thousand three hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand one hundred forty eight' AND ('two thousand one hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand three hundred forty' AND ('ten thousand three hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand two hundred forty four' AND ('six thousand two hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand four hundred thirty six' AND ('fourteen thousand four hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand one hundred twenty four' AND ('one thousand one hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand three hundred sixteen' AND ('nine thousand three hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand two hundred twenty' AND ('five thousand two hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand four hundred twelve' AND ('thirteen thousand four hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand one hundred seventy two' AND ('three thousand one hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand three hundred sixty four' AND ('eleven thousand three hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand two hundred sixty eight' AND ('seven thousand two hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand four hundred sixty' AND ('fifteen thousand four hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six hundred twelve' AND ('six hundred twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand eight hundred four' AND ('eight thousand eight hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand seven hundred eight' AND ('four thousand seven hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand nine hundred' AND ('twelve thousand nine hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand six hundred sixty' AND ('two thousand six hundred sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eight hundred fifty two' AND ('ten thousand eight hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand seven hundred fifty six' AND ('six thousand seven hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand nine hundred forty eight' AND ('fourteen thousand nine hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand six hundred thirty six' AND ('one thousand six hundred thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand eight hundred twenty eight' AND ('nine thousand eight hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand seven hundred thirty two' AND ('five thousand seven hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand nine hundred twenty four' AND ('thirteen thousand nine hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand six hundred eighty four' AND ('three thousand six hundred eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand eight hundred seventy six' AND ('eleven thousand eight hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand seven hundred eighty' AND ('seven thousand seven hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand nine hundred seventy two' AND ('fifteen thousand nine hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three hundred fifty six' AND ('three hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand five hundred forty eight' AND ('eight thousand five hundred forty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand four hundred fifty two' AND ('four thousand four hundred fifty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand six hundred forty four' AND ('twelve thousand six hundred forty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand four hundred four' AND ('two thousand four hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand five hundred ninety six' AND ('ten thousand five hundred ninety six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'six thousand five hundred' AND ('six thousand five hundred'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand six hundred ninety two' AND ('fourteen thousand six hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand three hundred eighty' AND ('one thousand three hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand five hundred seventy two' AND ('nine thousand five hundred seventy two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand four hundred seventy six' AND ('five thousand four hundred seventy six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand six hundred sixty eight' AND ('thirteen thousand six hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand four hundred twenty eight' AND ('three thousand four hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand six hundred twenty' AND ('eleven thousand six hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand five hundred twenty four' AND ('seven thousand five hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand seven hundred sixteen' AND ('fifteen thousand seven hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight hundred sixty eight' AND ('eight hundred sixty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'nine thousand sixty' AND ('nine thousand sixty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand nine hundred sixty four' AND ('four thousand nine hundred sixty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'thirteen thousand one hundred fifty six' AND ('thirteen thousand one hundred fifty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand nine hundred sixteen' AND ('two thousand nine hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eleven thousand one hundred eight' AND ('eleven thousand one hundred eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'seven thousand twelve' AND ('seven thousand twelve'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fifteen thousand two hundred four' AND ('fifteen thousand two hundred four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'one thousand eight hundred ninety two' AND ('one thousand eight hundred ninety two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'ten thousand eighty four' AND ('ten thousand eighty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'five thousand nine hundred eighty eight' AND ('five thousand nine hundred eighty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'fourteen thousand one hundred eighty' AND ('fourteen thousand one hundred eighty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'three thousand nine hundred forty' AND ('three thousand nine hundred forty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand one hundred thirty two' AND ('twelve thousand one hundred thirty two'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand thirty six' AND ('eight thousand thirty six'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'sixteen thousand two hundred twenty eight' AND ('sixteen thousand two hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two hundred twenty eight' AND ('two hundred twenty eight'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'eight thousand four hundred twenty' AND ('eight thousand four hundred twenty'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'four thousand three hundred twenty four' AND ('four thousand three hundred twenty four'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'twelve thousand five hundred sixteen' AND ('twelve thousand five hundred sixteen'||'~');
SELECT count(*), avg(b), sum(length(c)), group_concat(a) FROM z1
 WHERE c BETWEEN 'two thousand two hundred seventy six' AND ('two thousand two hundred seventy six'||'~');
COMMIT;
-- end test 170
