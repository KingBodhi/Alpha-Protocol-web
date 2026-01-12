import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../controllers/theme_controller.dart';
import '../../../theme/colors.dart';
import '../../../theme/typography.dart';
import '../../../theme/spacing.dart';

/// Develop Page - Quickstart Section
///
/// Code snippets with language tabs for getting started quickly.
class QuickstartSection extends StatelessWidget {
  const QuickstartSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > AppSpacing.tabletMax;

    return GetX<ThemeController>(
      builder: (theme) {
        final isDark = theme.effectiveIsDarkMode;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : 24,
            vertical: isDesktop ? 80 : 48,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                // Section Header
                Text(
                  'QUICKSTART',
                  style: AppTypography.headlineMedium(isDark: isDark).copyWith(
                    letterSpacing: 4,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(duration: 600.ms),

                const SizedBox(height: 12),

                Text(
                  'Up and running in seconds',
                  style: AppTypography.bodyLarge(isDark: isDark).copyWith(
                    color: AppColors.textMuted(isDark),
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(duration: 600.ms, delay: 100.ms),

                SizedBox(height: isDesktop ? 48 : 32),

                // Code Block
                _CodeBlock(isDark: isDark),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CodeBlock extends StatefulWidget {
  const _CodeBlock({required this.isDark});

  final bool isDark;

  @override
  State<_CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<_CodeBlock> {
  int _selectedTab = 0;
  bool _copied = false;

  final List<Map<String, String>> _tabs = [
    {
      'label': 'TypeScript',
      'install': 'npm install @alpha/sdk',
      'code': '''import { Alpha } from '@alpha/sdk'

const alpha = new Alpha({
  network: 'mainnet',
  apiKey: process.env.ALPHA_API_KEY
})

// Connect to the network
const node = await alpha.connect()

// Send a message
const tx = await alpha.send({
  to: 'alpha://address...',
  data: { message: 'Hello, decentralized web!' }
})

console.log('Transaction:', tx.hash)''',
    },
    {
      'label': 'Rust',
      'install': 'cargo add alpha-sdk',
      'code': '''use alpha_sdk::Alpha;

#[tokio::main]
async fn main() -> Result<()> {
    let alpha = Alpha::new()
        .network("mainnet")
        .api_key(env::var("ALPHA_API_KEY")?)
        .build()?;

    // Connect to the network
    let node = alpha.connect().await?;

    // Send a message
    let tx = alpha.send(SendRequest {
        to: "alpha://address...".into(),
        data: json!({ "message": "Hello!" }),
    }).await?;

    println!("Transaction: {}", tx.hash);
    Ok(())
}''',
    },
    {
      'label': 'Go',
      'install': 'go get github.com/alpha/sdk-go',
      'code': '''package main

import (
    "fmt"
    alpha "github.com/alpha/sdk-go"
)

func main() {
    client := alpha.New(alpha.Config{
        Network: "mainnet",
        APIKey:  os.Getenv("ALPHA_API_KEY"),
    })

    // Connect to the network
    node, _ := client.Connect()

    // Send a message
    tx, _ := client.Send(alpha.SendRequest{
        To:   "alpha://address...",
        Data: map[string]any{"message": "Hello!"},
    })

    fmt.Printf("Transaction: %s\\n", tx.Hash)
}''',
    },
    {
      'label': 'Python',
      'install': 'pip install alpha-sdk',
      'code': '''from alpha import Alpha
import os

alpha = Alpha(
    network="mainnet",
    api_key=os.environ["ALPHA_API_KEY"]
)

# Connect to the network
node = alpha.connect()

# Send a message
tx = alpha.send(
    to="alpha://address...",
    data={"message": "Hello, decentralized web!"}
)

print(f"Transaction: {tx.hash}")''',
    },
  ];

  void _copyCode() {
    final code = '${_tabs[_selectedTab]['install']!}\n\n'
        '${_tabs[_selectedTab]['code']!}';
    Clipboard.setData(ClipboardData(text: code));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            widget.isDark ? const Color(0xFF1A1A1A) : const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border(widget.isDark),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Tab Bar
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: widget.isDark
                  ? const Color(0xFF0D0D0D)
                  : const Color(0xFF121212),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final entry in _tabs.asMap().entries)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedTab = entry.key),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: entry.key == _selectedTab
                                      ? AppColors.primary.withValues(alpha: 0.2)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: entry.key == _selectedTab
                                      ? Border.all(
                                          color: AppColors.primary
                                              .withValues(alpha: 0.5),
                                        )
                                      : null,
                                ),
                                child: Text(
                                  entry.value['label']!,
                                  style: AppTypography.labelMedium(isDark: true)
                                      .copyWith(
                                    color: entry.key == _selectedTab
                                        ? AppColors.primary
                                        : Colors.grey[500],
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _copyCode,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _copied
                          ? Colors.green.withValues(alpha: 0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: _copied ? Colors.green : Colors.grey[700]!,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _copied ? Icons.check : Icons.copy_outlined,
                          size: 14,
                          color: _copied ? Colors.green : Colors.grey[500],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _copied ? 'Copied!' : 'Copy',
                          style:
                              AppTypography.labelSmall(isDark: true).copyWith(
                            color: _copied ? Colors.green : Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Install Command
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.05),
              border: Border(
                bottom: BorderSide(
                  color: AppColors.border(widget.isDark),
                ),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '\$',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SelectableText(
                    _tabs[_selectedTab]['install']!,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Code Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SelectableText(
                _tabs[_selectedTab]['code']!,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  height: 1.6,
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 200.ms);
  }
}
