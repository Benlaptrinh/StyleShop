package com.example.demo.utils;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.example.demo.model.Account;
import com.example.demo.model.Category;
import com.example.demo.model.Order;
import com.example.demo.model.Product;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;

public class ExcelExporter<T> {
    private XSSFWorkbook wb;
    private XSSFSheet sheet;
    private List<T> list;
    private String[] headers;
    String[] accountHeaders = { "Username", "Email", "Password", "Phone", "Address", "Is Admin", "Is Activated" };
    String[] categoryHeaders = { "ID", "Category Name" };
    String[] productHeaders = { "ID", "Name", "Price", "Image", "Available", "Create Date", "Category" };
    String[] orderHeaders = { "ID", "Address", "Create Date", "User" };

    public ExcelExporter(List<T> list, String sheetName) {
        this.list = list;
        setHeaderByListType(list);
        wb = new XSSFWorkbook();
        sheet = wb.createSheet(sheetName);
    }

    // hàm này để kiểm tra xem type của list là gì để set header
    public void setHeaderByListType(List<T> list) {
        if (list.get(0) instanceof Account) {
            this.headers = accountHeaders;
        } else if (list.get(0) instanceof Category) {
            this.headers = categoryHeaders;
        } else if (list.get(0) instanceof Product) {
            this.headers = productHeaders;
        } else if (list.get(0) instanceof Order) {
            this.headers = orderHeaders;
        }
    }

    // hàm này để set sheet header
    private void writeHeaderRow() {
        Row row = sheet.createRow(0);

        CellStyle style = wb.createCellStyle();
        XSSFFont font = wb.createFont();
        font.setBold(true);
        font.setFontHeight(16);
        style.setFont(font);

        // Create header cells
        if (headers != null && headers.length > 0) {
            for (int i = 0; i < headers.length; i++) {
                createCell(row, i, headers[i], style);
            }
        }
    }

    // hàm này để set data mỗi hàng
    private void writeDataRow() {
        int rowCount = 1;

        CellStyle style = wb.createCellStyle();
        XSSFFont font = wb.createFont();
        font.setFontHeight(14);
        style.setFont(font);

        for (T item : list) {
            Row row = sheet.createRow(rowCount++);
            int colCount = 0;

            if (item instanceof Account) {
                Account account = (Account) item;
                createCell(row, colCount++, account.getId(), style);
                createCell(row, colCount++, account.getEmail(), style);
                createCell(row, colCount++, account.getPassword(), style);
                createCell(row, colCount++, account.getPhone(), style);
                createCell(row, colCount++, account.getAddress(), style);
                createCell(row, colCount++, account.getAdmin(), style);
                createCell(row, colCount++, account.getActivated(), style);
            } else if (item instanceof Product) {
                Product product = (Product) item;
                System.out.println(product.toString());
                createCell(row, colCount++, product.getId(), style);
                createCell(row, colCount++, product.getName(), style);
                createCell(row, colCount++, product.getPrice(), style);
                createCell(row, colCount++, product.getImage(), style);
                createCell(row, colCount++, product.getAvailable(), style);
                createCell(row, colCount++, product.getCreatedate(), style);
                createCell(row, colCount++, product.getCategoryid().getName(), style);
            } else if (item instanceof Category) {
                Category category = (Category) item;
                createCell(row, colCount++, category.getId(), style);
                createCell(row, colCount++, category.getName(), style);
            } else if (item instanceof Order) {
                Order order = (Order) item;
                createCell(row, colCount++, order.getId(), style);
                createCell(row, colCount++, order.getAddress(), style);
                createCell(row, colCount++, order.getCreatedate(), style);
                createCell(row, colCount++, order.getUsername().getId(), style);
            }
        }
    }

    // hàm này để tạo cell theo type của value
    private void createCell(Row row, int colCount, Object value, CellStyle style) {
        sheet.autoSizeColumn(colCount);
        Cell cell = row.createCell(colCount);
        if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        } else if (value instanceof String) {
            cell.setCellValue((String) value);
        } else if (value instanceof Double) {
            cell.setCellValue((Double) value);
        } else if (value instanceof Integer) {
            cell.setCellValue((Integer) value);
        } else if (value instanceof Date) {
            cell.setCellValue((Date) value);
        } else if (value instanceof LocalDate) {
            cell.setCellValue(((LocalDate) value).format(DateTimeFormatter.ISO_DATE));
        } else {
            cell.setCellValue("");
        }
        cell.setCellStyle(style);
    }

    public void export(HttpServletResponse resp) throws IOException {
        writeHeaderRow();
        writeDataRow();
        ServletOutputStream out = resp.getOutputStream();
        wb.write(out);
        wb.close();
        out.close();
    }
}
