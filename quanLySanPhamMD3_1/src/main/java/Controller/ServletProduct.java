package Controller;

import models.models.Product;
import models.service.IServiceProduct;
import models.service.ServiceProduct;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletProduct", value = "/ServletProduct")
public class ServletProduct extends HttpServlet {
    IServiceProduct serviceProduct = new ServiceProduct();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        switch (action) {
            case "create":
                showFormCreate(request, response);
                break;
            case "update":
                showFormUpdate(request, response);
                break;
            case "showList":
                showListProduct(request, response);
                break;
            case "remove":
                removeProduct(request, response);
                break;
            case "search":
                System.out.println("se");
                searchByName(request, response);
                break;
            default:
                showListProduct(request, response);
                break;
        }
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("listProduct", serviceProduct.getProducts());
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/productList.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/createProduct.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product productUpdate = serviceProduct.findById(id);
        request.setAttribute("id", id);
        request.setAttribute("name", productUpdate.getName());
        request.setAttribute("price", productUpdate.getPrice());
        request.setAttribute("quantity", productUpdate.getQuantity());
        request.setAttribute("description", productUpdate.getDescribe());
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/updateProduct.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void removeProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        serviceProduct.remove(id);
        showListProduct(request, response);
    }

    private void searchByName(HttpServletRequest request,HttpServletResponse response) {
        String searchName = request.getParameter("searchName");
        List<Product> searchList = serviceProduct.searchByName(searchName);
        System.out.println(searchList);
        request.setAttribute("listProduct", searchList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/productList.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createNewProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
//            case "search":
//                searchByName(request, response);
//                break;
        }
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String description = request.getParameter("description");
            Product product = new Product(id, name, price, quantity, description);
            serviceProduct.creat(product);
            showListProduct(request, response);


    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        Product productUpdate = new Product(id, name, price, quantity, description);
        serviceProduct.update(id, productUpdate);
        showListProduct(request, response);
    }
}
