package com.xx.useflutterview

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.xx.useflutterview.databinding.ActivityMainBinding
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor


private const val FLUTTER_ENGINE_NAME = "my_flutter_engine_name"


class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        warmupFlutterEngine()

        binding.button.setOnClickListener {
            startActivity(
                FlutterActivity.withCachedEngine(FLUTTER_ENGINE_NAME)
                    .build(this)
            )
        }
    }

    private fun warmupFlutterEngine() {
        val flutterEngine = FlutterEngine(this)

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // Cache the FlutterEngine to be used by FlutterActivity.
        FlutterEngineCache
            .getInstance()
            .put(FLUTTER_ENGINE_NAME, flutterEngine)
    }
}