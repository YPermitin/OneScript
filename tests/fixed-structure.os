﻿#Использовать asserts

///////////////////////////////////////////////////////////////////////
// Тест класса ФиксированнаяСтруктура
///////////////////////////////////////////////////////////////////////

Перем юТест;

////////////////////////////////////////////////////////////////////
// Программный интерфейс

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_СоздатьФиксированнуюСтруктуруПоСтруктуре");
	ВсеТесты.Добавить("ТестДолжен_СоздатьФиксированнуюСтруктуруПоКлючамЗначениям");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьНеизменностьФиксированнойСтруктуры");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьМетодСвойство");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьОтсутствиеМетодаВставить");
	
	Возврат ВсеТесты;
КонецФункции

Процедура ТестДолжен_СоздатьФиксированнуюСтруктуруПоСтруктуре() Экспорт
	Структура = Новый Структура("Ключ1", "Значение1");
	
	ФиксированнаяСтруктура = Новый ФиксированнаяСтруктура(Структура);
	
	Ожидаем.Что(ТипЗнч(ФиксированнаяСтруктура)).Равно(Тип("ФиксированнаяСтруктура"));
	Ожидаем.Что(ФиксированнаяСтруктура.Количество(), "количество элементов исходной и полученной структуры совпадут").Равно(Структура.Количество());
	
КонецПроцедуры

Процедура ТестДолжен_СоздатьФиксированнуюСтруктуруПоКлючамЗначениям() Экспорт
	ФиксированнаяСтруктура = Новый ФиксированнаяСтруктура("Ключ1", "Значение1");
	
	Ожидаем.Что(ТипЗнч(ФиксированнаяСтруктура)).Равно(Тип("ФиксированнаяСтруктура"));
	Ожидаем.Что(ФиксированнаяСтруктура.Количество(), "количество элементов исходной и полученной структуры совпадут").Равно(1);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьНеизменностьФиксированнойСтруктуры() Экспорт
	Значение = "Значение1";
	Структура = Новый Структура("Ключ1", Значение);
	
	ФиксированнаяСтруктура = Новый ФиксированнаяСтруктура(Структура);
	
	Ожидаем.Что(ФиксированнаяСтруктура.Ключ1, "ФиксированнаяСтруктура.Ключ1 равно Структура.Ключ1").Равно(Структура.Ключ1);

	Структура.Ключ1 = Значение+1;
	Ожидаем.Что(ФиксированнаяСтруктура.Ключ1, "ФиксированнаяСтруктура.Ключ1/Значение1 не меняет своего значения после изменения Структура.Ключ1/Значение").Равно(Значение);

	Значение = "Значение10";
	Ожидаем.Что(ФиксированнаяСтруктура.Ключ1, "ФиксированнаяСтруктура.Ключ1/Значение1 не меняет своего значения после изменения исходной переменной").Равно("Значение1");
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьМетодСвойство() Экспорт
	Структура = Новый Структура("Ключ1", "Значение1");
	
	ФиксированнаяСтруктура = Новый ФиксированнаяСтруктура(Структура);
	
	Ожидаем.Что(ФиксированнаяСтруктура.Свойство("Ключ1"), "проверяем ФиксированнаяСтруктура.Свойство(""Ключ1"")").ЭтоИстина();
	Ожидаем.Что(ФиксированнаяСтруктура.Свойство("НесуществующийКлюч"), "проверяем ФиксированнаяСтруктура.Свойство(""Ключ1"")").ЭтоЛожь();
	
	Значение = Неопределено;
	ФиксированнаяСтруктура.Свойство("Ключ1", Значение);
	Ожидаем.Что(Значение, "проверяем значение из ФиксированнаяСтруктура.Свойство(""Ключ1"", Значение)").Равно("Значение1");

	Значение = Неопределено;
	ФиксированнаяСтруктура.Свойство("НесуществующийКлюч", Значение);
	Ожидаем.Что(Значение, "проверяем значение из ФиксированнаяСтруктура.Свойство(""Ключ1"", Значение)").Равно(Неопределено);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьОтсутствиеМетодаВставить() Экспорт
	Структура = Новый Структура("Ключ1", "Значение1");
	
	ФиксированнаяСтруктура = Новый ФиксированнаяСтруктура(Структура);
	
	Попытка
		ФиксированнаяСтруктура.Вставить("Ключ2", "Значение2");
	Исключение
		Ожидаем.Что(ФиксированнаяСтруктура.Количество(), "количество элементов фиксированной структуры не меняется").Равно(1);
		Возврат;
	КонецПопытки;

	ВызватьИсключение "У класса ""ФиксированнаяСтруктура"" не должно быть метода ""Вставить"", а он есть";	
КонецПроцедуры
