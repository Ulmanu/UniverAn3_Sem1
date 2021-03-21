package com.endava.internship.collections;

import com.endava.internship.collections.Student;
import com.endava.internship.collections.StudentList;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertAll;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestStudent {
    private StudentList list;
    private Student stud1;
    private Student stud2;
    private Student stud3;
    private Student stud4;
    private List<Student> list2;
    private Student studl1;
    private Student studl2;

    @BeforeEach
    void init() {
        list = new StudentList();
        stud1 = new Student("Petru", LocalDate.of(2001, 1, 1), "moldovan");
        stud2 = new Student("Petru1", LocalDate.of(2000, 1, 1), "moldovan1");
        stud3 = new Student("Petru2", LocalDate.of(1997, 1, 1), "moldovan2");
        stud4 = new Student("Petru3", LocalDate.of(1999, 1, 1), "moldovan3");
        list2 = new ArrayList<>();
        studl1 = new Student("Roman", LocalDate.of(2001, 1, 1), "rus");
        studl2 = new Student("Roman1", LocalDate.of(2000, 1, 1), "rus");
    }

    @AfterEach
    void end() {
        list.clear();
        list2.clear();
    }

    @Test
    public void testAdd() {
        Student expectedStudent = new Student("John Doe", LocalDate.of(2000, 5, 12), "");

        list.add(expectedStudent);

        assertAll("expectedStudent",
                () -> assertThat(list).contains(expectedStudent),
                () -> assertThat(list).hasSize(1),
                () -> assertThat(list.iterator().next()).isEqualTo(expectedStudent),
                () -> assertThat(list.get(0)).isEqualTo(expectedStudent),
                () -> assertThat(list.toArray(new Student[1])).containsOnly(expectedStudent)
        );
    }

    @Test
    public void testAddbyIndex() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.add(stud4);


        int intitialSize = list.size();
        System.out.println(list.get(2));
        Student expectedStudent = new Student("John Doe", LocalDate.of(2000, 5, 12), "");
        int index = 2;
        list.add(index, expectedStudent);

        assertAll("expectedStudent",
                () -> assertThat(list).contains(expectedStudent),
                () -> assertThat(list).hasSize(intitialSize + 1),
                () -> assertThat(list.get(index)).isEqualTo(expectedStudent),
                () -> assertThat(list.toArray(new Student[intitialSize + 1])).contains(expectedStudent),
                () -> assertThat(list.listIterator(index + 1).previous()).isEqualTo(stud3),
                () -> assertThat(list.listIterator(index + 1).next()).isEqualTo(stud3)
        );
    }

    @Test
    public void testRemoveIndexException() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.add(stud4);
        int intitialSize = list.size();

        int index = 5;
        Throwable exception = assertThrows(ArrayIndexOutOfBoundsException.class, () ->
        {
            list.remove(index);
            assertAll(
                    () -> assertFalse(list.contains(stud3)),
                    () -> assertThat(list).hasSize(intitialSize - 1),
                    () -> assertFalse(list.get(index).equals(stud3))
            );
        });
        assertEquals("Index Out of Bounds", exception.getMessage());
    }

    @Test
    public void testRemoveIndex() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.add(stud4);
        int intitialSize = list.size();

        int index = 2;

        list.remove(index);
        assertAll(
                () -> assertFalse(list.contains(stud3)),
                () -> assertThat(list).hasSize(intitialSize - 1),
                () -> assertFalse(list.get(index).equals(stud3))
        );
    }

    @Test
    public void testRemovebyObject() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.add(stud4);
        list.add(stud2);
        list.add(stud2);
        int initialSize = list.size();

        list.remove(stud2);

        assertAll(
                () -> assertFalse(list.contains(stud2)),
                () -> assertThat(list).hasSize(initialSize - 3),
                () -> assertThat(list.listIterator(0).next()).isEqualTo(stud1)
        );
    }

    @Test
    public void testContains() {
        list.add(stud1);
        list.add(stud2);
        list.contains(stud2);

        assertAll(
                () -> assertThat(list).contains(stud2),
                () -> assertTrue(list.contains(stud2)),
                () -> assertFalse(list.contains(stud3))
        );
    }

    @Test
    public void testSize() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.add(stud4);
        list.add(stud2);
        list.add(stud2);

        int countElem = 0;
        for (Object j : list) {
            countElem++;
        }

        int finalCountElem = countElem;
        assertAll(
                () -> assertTrue(list.size() == finalCountElem),
                () -> assertThat(list).hasSize(6),
                () -> assertTrue(list.size() == 6)
        );
    }

    @Test
    public void testClear() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.add(stud4);
        list.add(stud2);
        list.add(stud2);

        list.clear();

        assertAll(
                () -> assertTrue(list.size() == 0)
        );
    }

    @Test
    public void testSet() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.set(2, stud1);

        assertAll(
                () -> assertFalse(list.contains(stud3)),
                () -> assertThat(list).hasSize(3),
                () -> assertTrue(list.get(2).equals(stud1))
        );

        Throwable exception = assertThrows(ArrayIndexOutOfBoundsException.class, () ->
        {
            list.set(20, stud1);
        });

        assertEquals("Index Out of Bounds", exception.getMessage());
    }

    @Test
    public void testIsEmpty() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.isEmpty();

        assertFalse(list.size() == 0);
        assertFalse(list.isEmpty());

        list.clear();
        assertTrue(list.size() == 0);
        assertTrue(list.isEmpty());
    }

    @Test
    public void testGet() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.get(2);

        assertAll(
                () -> assertTrue(list.contains(stud3)),
                () -> assertThat(list).hasSize(3),
                () -> assertTrue(list.get(2).equals(stud3))
        );

        Throwable exception = assertThrows(ArrayIndexOutOfBoundsException.class, () ->
        {
            list.get(-1);
        });

        assertEquals("Index Out of Bounds", exception.getMessage());
    }

    @Test
    public void testToArray() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);

        Object[] studlist = list.toArray();

        assertAll(
                () -> assertThat(studlist).contains(stud2),
                () -> assertThat(studlist).isNotEmpty(),
                () -> assertTrue(studlist.length == 3)
        );
    }

    @Test
    public void testIndexOf() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.add(stud4);
        list.add(stud2);
        list.add(stud2);

        list.indexOf(stud2);
        int expectedIndex = 1;
        assertAll(
                () -> assertThat(list.get(list.indexOf(stud2))).isEqualTo(stud2),
                () -> assertEquals(list.indexOf(stud2), expectedIndex),
                () -> assertTrue(list.toArray(new Student[list.size()])[(list.indexOf(stud2))].equals(stud2))
        );
    }

    @Test
    public void testLastIndexOf() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.add(stud4);
        list.add(stud2);
        list.add(stud2);

        list.lastIndexOf(stud2);
        int expectedIndex = 5;

        assertAll(
                () -> assertThat(list.get(list.lastIndexOf(stud2))).isEqualTo(stud2),
                () -> assertEquals(list.lastIndexOf(stud2), expectedIndex),
                () -> assertTrue(list.toArray(new Student[list.size()])[(list.lastIndexOf(stud2))].equals(stud2))
        );
    }

    @Test
    public void testIteratorException() {
        assertFalse(list.iterator().hasNext());
        Throwable exception = assertThrows(ArrayIndexOutOfBoundsException.class, () ->
        {
            list.iterator().next();
        });

        assertEquals("Index Out of Bounds", exception.getMessage());
    }

    @Test
    public void testIterator() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        System.out.println(list.size());

        Iterator<Student> lstud = list.iterator();
        int countElem = 0;
        while (lstud.hasNext()) {
            lstud.next();
            countElem++;
        }
        assertEquals(3, countElem);
    }

    @Test
    public void testListIteratorException() {
        assertFalse(list.listIterator().hasNext());
        assertFalse(list.listIterator().hasPrevious());
        Throwable exception = assertThrows(ArrayIndexOutOfBoundsException.class, () ->
        {
            list.listIterator().next();
            list.listIterator().previous();
        });

        assertEquals("Index Out of Bounds", exception.getMessage());
    }

    @Test
    public void testListIterator() {
        list.add(stud1);
        list.add(stud2);
        list.add(stud3);

        int countElem = 0;
        Iterator<Student> lstud = list.iterator();
        ListIterator<Student> listud = list.listIterator();
        while (listud.hasNext()) {
            listud.next();
            countElem++;
        }
        assertEquals(3, countElem);

        countElem = 0;
        ListIterator<Student> listudi = list.listIterator(2);
        while (listudi.hasPrevious()) {
            listudi.previous();
            countElem++;
        }
        assertEquals(2, countElem);
    }

    @Test
    public void testSublist() {
        Throwable exception = assertThrows(ArrayIndexOutOfBoundsException.class, () ->
        {
            List<Student> sublist = list.subList(2, 4);
            for (Student s : sublist) {
                System.out.println(s.getName());
            }
        });

        assertEquals("Index Out of Bounds", exception.getMessage());

        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.add(stud4);
        list.add(stud2);
        list.add(stud2);

        List<Student> sublist = list.subList(2, 4);
        int countElem = 0;
        for (Student s : sublist) {
            countElem++;
        }
        assertEquals(2, countElem);

        List<Student> sublist1 = list.subList(2, 3);
        countElem = 0;
        for (Student s : sublist1) {
            countElem++;
        }
        assertEquals(1, countElem);
    }

    @Test
    public void testAddAll() {
        list2.add(studl1);
        list2.add(studl2);

        int initialSize = list.size();
        list.addAll(list2);
        initialSize += list2.size();

        int finalInitialSize = initialSize;
        assertAll(
                () -> assertThat(list).contains(studl1),
                () -> assertThat(list).contains(studl2),
                () -> assertThat(list).hasSize(finalInitialSize),
                () -> assertThat(list.listIterator().next()).isEqualTo(studl1),
                () -> assertThat(list.get(1)).isEqualTo(studl2),
                () -> assertThat(list.toArray(new Student[finalInitialSize])).contains(studl1),
                () -> assertThat(list.toArray(new Student[finalInitialSize])).contains(studl2)
        );
    }

    @Test
    public void testAddAllbyIndex() {
        list2.add(studl1);
        list.addAll(0, list2);
        assertThat(list.toArray(new Student[list.size()])).containsOnly(studl1);
        assertThat(list).hasSize(1);
        list2.clear();

        list.addAll(0, list2);
        assertThat(list.toArray(new Student[list.size()])).containsOnly(studl1);
        assertThat(list).hasSize(1);
        assertThat(list.get(0)).isEqualTo(studl1);
        list2.clear();

        Throwable exception = assertThrows(ArrayIndexOutOfBoundsException.class, () ->
        {
            list.clear();
            System.out.println(list.size());
            list.addAll(1, list2);
            list.addAll(-1, list2);
        });

        assertEquals("Index Out of Bounds", exception.getMessage());

        list.add(stud1);
        list.add(stud2);
        list.add(stud3);
        list.add(stud4);
        list2.add(studl1);
        list2.add(studl2);

        int initialSize = list.size();
        list.addAll(1, list2);
        initialSize += list2.size();

        int finalInitialSize = initialSize;
        assertAll(
                () -> assertThat(list).contains(studl1),
                () -> assertThat(list).contains(studl2),
                () -> assertThat(list).hasSize(finalInitialSize),
                () -> assertThat(list.listIterator(1).next()).isEqualTo(studl1),
                () -> assertThat(list.get(2)).isEqualTo(studl2),
                () -> assertThat(list.toArray(new Student[finalInitialSize])).contains(studl1),
                () -> assertThat(list.toArray(new Student[finalInitialSize])).contains(studl2)
        );
    }

    @Test
    public void testContainsAll() {
        list.add(stud1);
        list.add(stud2);
        list2.add(studl1);
        list.addAll(list2);
        list.containsAll(list2);
        list2.add(studl2);
        list.containsAll(list2);

        assertAll(
                () -> assertThat(list).contains(studl1),
                () -> assertFalse(list.contains(studl2))
        );
    }

    @Test
    public void testRemoveAll() {
        list.add(stud1);
        list.add(stud2);
        int initialSize = list.size();
        list2.add(studl1);
        list2.add(studl2);
        list.addAll(list2);

        list.containsAll(list2);
        list.removeAll(list2);

        assertAll(
                () -> assertFalse(list.contains(studl1)),
                () -> assertFalse(list.contains(studl2)),
                () -> assertThat(list).hasSize(initialSize)
        );
    }

    @Test
    public void testRetainAll() {
        list.add(stud1);
        list.add(stud2);
        list2.add(studl1);
        list2.add(studl2);
        list2.add(studl2);
        list2.add(studl2);
        list2.add(studl2);
        int list2Size = list2.size();

        list.addAll(list2);

        list.retainAll(list2);

        assertAll(
                () -> assertFalse(list.contains(stud1)),
                () -> assertFalse(list.contains(stud2)),
                () -> assertThat(list).hasSize(list2Size)
        );
    }
}
