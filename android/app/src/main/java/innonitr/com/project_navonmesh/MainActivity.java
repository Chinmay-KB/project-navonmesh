package innonitr.com.project_navonmesh;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.util.Log;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

  String response="Nopeski";
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    new MethodChannel(getFlutterView(), "API_CALL").setMethodCallHandler(
            new MethodChannel.MethodCallHandler() {
                @Override
                public void onMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) {
                    if(methodCall.method.equalsIgnoreCase("api_call")){
                        StringRequest request = new StringRequest(Request.Method.GET, methodCall.argument("url"), new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                if (!response.equals(null)) {
                                    result.success(response);
                                } else {
                                    Log.e("Your Array Response", "Data Null");
                                }
                            }

                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Log.e("error is ", "" + error);
                            }
                        }) {

                            //This is for Headers If You Needed
                            @Override
                            public Map<String, String> getHeaders() throws AuthFailureError {
                                String token=methodCall.argument("token");
                                Map<String, String> params = new HashMap<String, String>();
                                params.put("Content-Type", "application/json; charset=UTF-8");
                                params.put("Authorization", "Bearer "+token);
                                return params;
                            }

                        };
                        RequestQueue queue = Volley.newRequestQueue(getApplicationContext());
                        queue.add(request);

                    }
                    if (methodCall.method.equalsIgnoreCase("payment_call")) {
                        StringRequest request = new StringRequest(Request.Method.POST, methodCall.argument("url"), new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                if (!response.equals(null)) {
                                    result.success(response);
                                } else {
                                    Log.e("Your Array Response", "Data Null");
                                }
                            }

                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Log.e("error is ", "" + error);
                            }
                        }) {

                            //This is for Headers If You Needed
                            @Override
                            public Map<String, String> getHeaders() throws AuthFailureError {
                                String token = methodCall.argument("token");
                                Map<String, String> params = new HashMap<String, String>();
                                params.put("Content-Type", "application/json; charset=UTF-8");
                                params.put("Authorization", "Bearer " + token);
                                return params;
                            }

                        };
                        RequestQueue queue = Volley.newRequestQueue(getApplicationContext());
                        queue.add(request);

                    }
                    if (methodCall.method.equalsIgnoreCase("workshop_payment_call")) {
                        StringRequest request = new StringRequest(Request.Method.POST, methodCall.argument("url"), new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                if (!response.equals(null)) {
                                    result.success(response);
                                } else {
                                    Log.e("Your Array Response", "Data Null");
                                }
                            }

                        }, new Response.ErrorListener() {
                            @Override
                            public void onErrorResponse(VolleyError error) {
                                Log.e("error is ", "" + error);
                            }
                        }) {


                            //This is for Headers If You Needed
                            @Override
                            public Map<String, String> getHeaders() throws AuthFailureError {
                                String token = methodCall.argument("token");
                                Map<String, String> header = new HashMap<String, String>();
                                header.put("Content-Type", "application/json; charset=UTF-8");
                                header.put("Authorization", "Bearer " + token);
                                return header;
                            }

                            @Override
                            protected Map<String, String> getParams() throws AuthFailureError {
                                Log.e("Tag tag", "getParams is working");
                                Map<String, String> params = new HashMap<String, String>();
                                String eid = methodCall.argument("eid");
                                String title = methodCall.argument("title");
                                params.put("title", "INTERNET OF THINGS (IoT)");
                                params.put("eid", "108");
                                return params;
                            }


                        };
                        Log.d("String request", request.toString());
                        RequestQueue queue = Volley.newRequestQueue(getApplicationContext());
                        queue.add(request);

                    }
                }
            }
    );
  }
}