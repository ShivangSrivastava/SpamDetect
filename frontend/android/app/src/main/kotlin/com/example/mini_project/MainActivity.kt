package com.example.frontend
import android.content.ContentResolver
import android.database.Cursor
import android.os.Bundle
import android.provider.Telephony
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.frontend"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        flutterEngine?.dartExecutor?.let {
            MethodChannel(it.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                if (call.method == "getAllSms") {
                    val smsList = getAllSms()
                    if (smsList.isNotEmpty()) {
                        result.success(smsList)
                    } else {
                        result.error("UNAVAILABLE", "SMS not available", null)
                    }
                } else {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getAllSms(): List<Map<String, String>> {
        val smsList = mutableListOf<Map<String, String>>()
        val contentResolver: ContentResolver = contentResolver
        val cursor: Cursor? = contentResolver.query(
            Telephony.Sms.CONTENT_URI,
            arrayOf(Telephony.Sms.BODY, Telephony.Sms.ADDRESS), // Include ADDRESS for sender info
            null, null, null
        )

        cursor?.use {
            val bodyIndex = cursor.getColumnIndex(Telephony.Sms.BODY)
            val addressIndex = cursor.getColumnIndex(Telephony.Sms.ADDRESS)
            while (cursor.moveToNext()) {
                val body = cursor.getString(bodyIndex)
                val address = cursor.getString(addressIndex)
                if (body != null && address != null) {
                    smsList.add(mapOf("body" to body, "sender" to address))
                }
            }
        }

        return smsList
    }
}
