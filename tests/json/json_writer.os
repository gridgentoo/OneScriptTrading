#Использовать asserts

Перем юТест;
Перем ТекстПроверки;

Функция ПолучитьСписокТестов(Тестирование) Экспорт

	юТест = Тестирование;

	СписокТестов = Новый Массив;
	
	СписокТестов.Добавить("Тест_Должен_СверитьХешСуммуСгенерированнойСтрокиJSON");
	Возврат СписокТестов;

КонецФункции

Процедура Тест_Должен_СверитьХешСуммуСгенерированнойСтрокиJSON() Экспорт
	
	Запись = Новый ЗаписьJson();
	Запись.УстановитьСтроку();
	Запись.ЗаписатьНачалоОбъекта();
	Запись.ЗаписатьИмяСвойства("firstName");
	Запись.ЗаписатьЗначение("Иван");
	Запись.ЗаписатьИмяСвойства("lastName");
	Запись.ЗаписатьЗначение("Иванов");
	
	Запись.ЗаписатьИмяСвойства("address");	
	Запись.ЗаписатьНачалоОбъекта();
	Запись.ЗаписатьИмяСвойства("streetAddress");
	Запись.ЗаписатьЗначение("Московское ш., 101, кв.101");
	Запись.ЗаписатьИмяСвойства("city");
	Запись.ЗаписатьЗначение("Ленинград");
	Запись.ЗаписатьИмяСвойства("postalCode");
	Запись.ЗаписатьЗначение(101101);
	Запись.ЗаписатьИмяСвойства("float");
	Запись.ЗаписатьЗначение(1.54);
	Запись.ЗаписатьИмяСвойства("undefined");
	Запись.ЗаписатьЗначение(Неопределено);
	Запись.ЗаписатьКонецОбъекта();

	Запись.ЗаписатьИмяСвойства("phoneNumbers");
	Запись.ЗаписатьНачалоМассива();
	Запись.ЗаписатьЗначение("812 123-1234");
	Запись.ЗаписатьЗначение("916 123-4567");
	Запись.ЗаписатьКонецМассива();
	
	Запись.ЗаписатьКонецОбъекта();
	
	Текст = Запись.Закрыть();
		
	Хеширование = Новый ХешированиеДанных(ХешФункция.CRC32);
	Хеширование.Добавить(Текст);	
		
	юТест.ПроверитьРавенство(Хеширование.ХешСумма, 2340095307);
	
КонецПроцедуры
